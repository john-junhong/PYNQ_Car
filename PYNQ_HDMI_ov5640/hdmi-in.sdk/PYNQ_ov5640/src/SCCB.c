

#include "SCCB.h"
#include "platform.h"

/*
-----------------------------------------------
   ����: start����,SCCB����ʼ�ź�
   ����: ��
 ����ֵ: ��
-----------------------------------------------
*/
void startSCCB(void)
{int Status;
/*
 * Initialize the GPIO driver
 */
Status = XGpio_Initialize(&IIC, XPAR_AXI_GPIO_0_DEVICE_ID);
    SIO_D_OUT;
    SIO_D_SET;     //�����߸ߵ�ƽ
    CLOCK_DELAY;

    SIO_C_OUT; 
    SIO_C_SET;     //��ʱ���߸ߵ�ʱ���������ɸ�����
    CLOCK_DELAY;

    SIO_D_CLR;
    CLOCK_DELAY;

    SIO_C_CLR;   //�����߻ָ��͵�ƽ��������������Ҫ
    CLOCK_DELAY;

}
/*
-----------------------------------------------
   ����: stop����,SCCB��ֹͣ�ź�
   ����: ��
 ����ֵ: ��
-----------------------------------------------
*/
void stopSCCB(void)
{
    SIO_D_CLR;
    CLOCK_DELAY;
 
    SIO_C_SET;
    CLOCK_DELAY;
  
    SIO_D_SET;
    CLOCK_DELAY;

}

/*
-----------------------------------------------
   ����: noAck,����������ȡ�е����һ����������
   ����: ��
 ����ֵ: ��
-----------------------------------------------
*/
void noAck(void)
{

    SIO_D_SET;
    CLOCK_DELAY;
    
    SIO_C_SET;
    CLOCK_DELAY;
    
    SIO_C_CLR;
    CLOCK_DELAY;
    
    SIO_D_CLR;
    CLOCK_DELAY;

}

/*
-----------------------------------------------
   ����: д��һ���ֽڵ����ݵ�SCCB
   ����: д������
 ����ֵ: ���ͳɹ�����1������ʧ�ܷ���0
-----------------------------------------------
*/
uchar   SCCBScan(uchar Address)
{
    startSCCB();
    if(SCCBwriteByte((Address<<1)+0))return Address;
    else return 0;
}

uchar SCCBwriteByte(uchar m_data)
{
    unsigned char j,tem;

    for(j=0;j<8;j++) //ѭ��8�η�������
    {
        if((m_data<<j)&0x80)
        {
            SIO_D_SET;
        }
        else
        {
            SIO_D_CLR;
        }
        CLOCK_DELAY;
        SIO_C_SET;
        CLOCK_DELAY;
        SIO_C_CLR;
        CLOCK_DELAY;

    }
    CLOCK_DELAY;
    
    SIO_D_IN;/*����SDAΪ����*/
    CLOCK_DELAY;
    SIO_C_SET;
    CLOCK_DELAY;
    if(SIO_D_STATE)
    {
        tem=0;   //SDA=1����ʧ�ܣ�����0
    }
    else
    {
        tem=1;   //SDA=0���ͳɹ�������1
    }
    SIO_C_CLR;
    CLOCK_DELAY;  
    SIO_D_OUT;/*����SDAΪ���*/

    return(tem);  
}

/*
-----------------------------------------------
   ����: һ���ֽ����ݶ�ȡ���ҷ���
   ����: ��
 ����ֵ: ��ȡ��������
-----------------------------------------------
*/
uchar SCCBreadByte(void)
{
    unsigned char read,j;
    read=0x00;

    SIO_D_IN;/*����SDAΪ����*/
    CLOCK_DELAY;
    for(j=8;j>0;j--) //ѭ��8�ν�������
    {            
        CLOCK_DELAY;
        SIO_C_SET;
        CLOCK_DELAY;
        read=read<<1;
        if(SIO_D_STATE) 
        {
            read=read+1;
        }
        SIO_C_CLR;
        CLOCK_DELAY;
    }   
    SIO_D_OUT;/*����SDAΪ���*/
    return(read);
    
}

/*
-----------------------------------------------
   ����: д��һ���ֽڵ����ݵ�SCCB
   ����: д������
 ����ֵ: ���ͳɹ�����1������ʧ�ܷ���0
-----------------------------------------------
*/
uchar SCCBwriteWord(u16 m_data)
{
    if(SCCBwriteByte(m_data >> 8) == 0)
    {
        return 0;
    }
    
    if(SCCBwriteByte(m_data) == 0)
    {
        return 0;
    }
    
    return 1;
}
