Return-Path: <raheesom@navpoint.com>
Message-Id: <200104170441.f3H4fuW29720@west.navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 16 Apr 2001 23:34:20 -0400
Mime-Version: 1.0
Subject: [linux-lvm] CDRECORD not working when LVM loaded.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm running a RH7 system on which I have the Logical Volume Management
of kernel 2.4.3 installed,but not configured (LVM not doing anything
yet).

I had some trouble using cdrecord, and saw the man page for cdrecord,
particularly the following part where it says that cdrecord cannot be
used in conjunction with volume management.

I don't really know what  is meant in the paragraph about USCSI fallback
SCSI transport code.


        On Solaris you need to stop the volume management  if  you
        like  to  use the USCSI fallback SCSI transport code. Even
        things like cdrecord -scanbus will not work if the  volume
        management is running.


I unloaded the "lvm-mod" kernel module, and cdrecord works fine without
it.

Basically I'm merely trying to find out whether I can get my system
working with both LVM and cdrecord concurrently.

I assume in order to use LVM, I would need to keep the lvm kernel module
loaded.   Since I had to unload this module in order to use cdrecord, I
assume that I can only use cdrecord OR LVM on any one system.   Am I
correct here?

Is there any workaround for my situation?  Perhaps not using the USCSI
fallback code when using cdrecord?


-- 
regs
rupert
