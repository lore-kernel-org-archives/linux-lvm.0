Message-ID: <615A249B783CD41192F400D0B747AC8608982668@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Subject: RE: [linux-lvm] lvcreate distributed extent option
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Nov 30 12:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

Hello,

there still seems to be a missunderstanding
I want to have the following:

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/sdd1                 00001  0          1        
   00001 /dev/sde1                 00001  0          0        
   00002 /dev/sdf1                 00001  0          0        
   00003 /dev/sdg1                 00001  0          0        
   00004 /dev/sdh1                 00001  0          0        
   00005 /dev/sdi1                 00001  0          0        
   00006 /dev/sdd1                 00002  0          0        
   00007 /dev/sde1                 00002  0          0        
   00008 /dev/sdf1                 00002  0          0        
   00009 /dev/sdg1                 00002  0          0        
   00010 /dev/sdh1                 00002  0          0        
   00011 /dev/sdi1                 00002  0          0        
   00012 /dev/sdd1                 00003  0          0        
   00013 /dev/sde1                 00003  0          0        
   00014 /dev/sdf1                 00003  0          0        
.....

but with  lvcreate -I 8 -L 40000M -n lvdata /dev/vgtest /dev/sdd1 /dev/sde1
.... I get

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/sdd1                 00063  0          1        
   00001 /dev/sdd1                 00064  0          0        
   00002 /dev/sdd1                 00065  0          0        
   00003 /dev/sdd1                 00066  0          0        
   00004 /dev/sdd1                 00067  0          0        
   00005 /dev/sdd1                 00068  0          0        
   00006 /dev/sdd1                 00069  0          0        
   00007 /dev/sdd1                 00070  0          0        
   00008 /dev/sdd1                 00071  0          0        
   00009 /dev/sdd1                 00072  0          0        
   00010 /dev/sdd1                 00073  0          0        
   00011 /dev/sdd1                 00074  0          0        
   00012 /dev/sdd1                 00075  0          0        
   00013 /dev/sdd1                 00076  0          0        
   00014 /dev/sdd1                 00077  0          0  
...
   02105 /dev/sde1                 00063  0          0        
   02106 /dev/sde1                 00064  0          0        
   02107 /dev/sde1                 00065  0          0        
   02108 /dev/sde1                 00066  0          0        
   02109 /dev/sde1                 00067  0          0        
   02110 /dev/sde1                 00068  0          0        
   02111 /dev/sde1                 00069  0          0        
   02112 /dev/sde1                 00070  0          0        

A distribution like described above looks like this on HP-UX LVM:    

   00000 /dev/dsk/c16t0d0   00012 current
   00001 /dev/dsk/c16t0d1   00012 current
   00002 /dev/dsk/c17t0d2   00000 current
   00003 /dev/dsk/c17t0d3   00000 current
   00004 /dev/dsk/c16t0d4   00000 current
   00005 /dev/dsk/c16t0d5   00000 current
   00006 /dev/dsk/c17t0d6   00000 current
   00007 /dev/dsk/c17t0d7   00000 current
   00008 /dev/dsk/c16t1d0   00000 current
   00009 /dev/dsk/c16t1d1   00000 current
   00010 /dev/dsk/c17t1d2   00000 current
   00011 /dev/dsk/c17t1d3   00000 current
   00012 /dev/dsk/c16t1d4   00000 current  

Holger 


-----Original Message-----
From: James Hawtin [mailto:oolon@ankh.org]
Sent: Samstag, 30. November 2002 18:24
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com
Subject: Re: [linux-lvm] lvcreate distributed extent option


This message uses a character set that is not supported by the Internet
Service.  To view the original message content,  open the attached message.
If the text doesn't display correctly, save the attachment to disk, and then
open it using a viewer that can display the original character set. 
