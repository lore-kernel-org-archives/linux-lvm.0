Return-Path: <tmdg@lindbergh.avbrief.com>
From: Tom Dawes-Gamble <tmdg@avbrief.com>
Message-Id: <200101190934.JAA05616@lindbergh.avbrief.com>
Date: Fri, 19 Jan 2001 09:34:18 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] fdisk and the LVM partition.
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

	Is anyone actively pursuing getting the LVM partition ID
"Registered"?

	  I got a little tee-d off with the LVM partition showing 
'Unknown' so I fixed my fdisk with this patch to i386_sys_types.c

*** i386_sys_types.c    Fri Jan 19 09:30:07 2001
--- i386_sys_types.c.new        Fri Jan 19 09:29:52 2001
***************
*** 58,63 ****
--- 58,64 ----
        {0x85, N_("Linux extended")},
        {0x86, N_("NTFS volume set")},
        {0x87, N_("NTFS volume set")},
+       {0x8e, N_("LVM Physical volume")}, /* LVM http://www.sistina.com/lvm/ */
        {0x93, N_("Amoeba")},
        {0x94, N_("Amoeba BBT")},       /* (bad block table) */
        {0xa0, N_("IBM Thinkpad hibernation")},     



	So now my fdisk knows about LVM partitions.

	While checking that fdisk still worked correctly I was reminded
the we used to use Partition type 'fe' but I guess that got stolen by LANstep. 

	I changed the type of my 'fe' to '8e' and rebooted no problems.
Though I guess I can't go back to my old and I mean "really" old kernel.  :-)

	
Regards,
Tom.

-- 
char  *r,*e,*w="%.9s%.7s%.7s\n";extern int printf(const char*,...);int main(){
int l=*w,a,b,th=*(w-~(l/=l))-*(w+l);b=*w+~th--;a=b-th;//Aviation Briefing Ltd.
r=e="  DISPLAY'tmdg@avbr';,,;'ief.com'*>"+b;l+=~b,th-=printf(w,e-a,th+e,r);
r=e="  DISPLAY'http://www.avbrief.com/' *>"-~b,exit(~l-printf(w,e+~a,th+e,r));}
