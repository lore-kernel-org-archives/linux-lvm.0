From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Message-Id: <200010111752.AA047466746@fb0442.mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
Date: Wed, 11 Oct 2000 19:52:25 MESZ
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,
> 
> I have resized the file system to 90G successfully but, there always a
> but isn't there :-), df now reports a total of 88Gb.
> 
> Out of interest is this due to rounding or reisfer/LVM housekeeping ?
> 
neither nor :-).

> # umount /lv01
> # resize_reiserfs -s90000M /dev/vg01/lv01

resize_reiserfs did what you said. But 90000MB is not equal to 90GB
The standard power for the transfer K->M->G is 1024 (most tools) and 
not 1000 (==> 92160MB = 90 GB).

Compare the difference of 'df -h' ("real GB") and 'df -H' ("marketing GB").

Regards, Holger
--
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
