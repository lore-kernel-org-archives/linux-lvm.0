Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4T9F1Zf007123
	for <linux-lvm@redhat.com>; Tue, 29 May 2012 05:15:01 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4T9ExjJ013824
	for <linux-lvm@redhat.com>; Tue, 29 May 2012 05:14:59 -0400
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1SZIG2-0002at-C6
	for linux-lvm@redhat.com; Tue, 29 May 2012 09:58:26 +0100
Message-ID: <4FC4938C.7090503@ankh.org>
Date: Tue, 29 May 2012 10:14:52 +0100
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
In-Reply-To: <CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------060004020707060101010102"
Subject: Re: [linux-lvm] LVM2 recovery on IP-SAN after OS re-install
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060004020707060101010102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/12 19:40, tariq wali wrote:
> Hi,
>  We had an OS crash on x86_64 CentOS , LVM2 and it had 6TB LUN  via 
>  IP SCSI SAN mounted to it and after the OS reinstall on a crash we 
> had hard time to mount the original SAN volume as you can imagine 6TB 
> of marketing data with 3 LVM partitions as data data1 and data2 . 
> After troubleshooting almost for a day I was able to get the LVM 
> metadata using dd from the SAN LUN /dev/sdd1 which I used to recreate 
> and restore all LVM partitions back to original state , we sure became 
> the raving fans of LVM today ! however after all the recovery I see 
> this annoying warning each time I execute any of the lvm commands ..
>
> lvs
> *  Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn: using 
> /dev/sdd1 not/dev/sdc1*
>   LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
>   data  vg0  -wi-ao 2.00T
>   data1 vg0  -wi-ao 2.00T
>   data2 vg0  -wi-ao 1.44T
>

1) The the same lun presented to the computer more than once? If this is 
a deliberate thing for redundancy then your need to setup multipath to 
take advantage use the devices in /dev/mapper of this and mask off the 
raw /dev/sd? devices in your /etc/lvm/lvm.conf

2) Did you copy all the data from one disk to another? if so is the old 
disk still available to the system?

3) Check you lun masking.

James

--------------060004020707060101010102
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 28/05/12 19:40, tariq wali wrote:
    <blockquote
cite="mid:CAGQjrKZ0CD7O8_KYBd+KvBmK0nnxxoWc+5sm0Pk+XYkZEq3vOQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi,
        <div>&nbsp;We had an OS crash on&nbsp;x86_64 CentOS , LVM2 and it had 6TB
          LUN &nbsp;via &nbsp;IP SCSI SAN mounted to it and after the OS reinstall
          on a crash we had hard time to mount the original SAN volume
          as you can imagine 6TB of&nbsp;marketing&nbsp;data with 3 LVM partitions
          as data data1 and data2 . After troubleshooting almost for a
          day I was able to get the LVM metadata using dd from the SAN
          LUN&nbsp;/dev/sdd1 which I used to recreate and restore all LVM
          partitions back to original state , we sure became the raving
          fans of LVM today ! however after all the recovery I see this
          annoying warning each time I execute any of the lvm commands
          ..</div>
        <div><br>
        </div>
        <div>lvs</div>
        <div><b>&nbsp; Found duplicate PV XtGmeFOiCTWpLBckKZKlGtYKPVdBgVJn:
            using /dev/sdd1 not<span
              style="background-color:rgb(255,255,255)"><font
                color="#ff0000"> /dev/sdc1</font></span></b></div>
        <div>&nbsp; LV &nbsp; &nbsp;VG &nbsp; Attr &nbsp; LSize Origin Snap% &nbsp;Move Log Copy%
          &nbsp;Convert</div>
        <div>&nbsp; data &nbsp;vg0 &nbsp;-wi-ao 2.00T &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp;</div>
        <div>&nbsp; data1 vg0 &nbsp;-wi-ao 2.00T &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp;</div>
        <div>&nbsp; data2 vg0 &nbsp;-wi-ao 1.44T &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp;</div>
        <div>&nbsp;<br>
        </div>
      </div>
    </blockquote>
    <br>
    1) The the same lun presented to the computer more than once? If
    this is a deliberate thing for redundancy then your need to setup
    multipath to take advantage use the devices in /dev/mapper of this
    and mask off the raw /dev/sd? devices in your /etc/lvm/lvm.conf<br>
    <br>
    2) Did you copy all the data from one disk to another? if so is the
    old disk still available to the system?<br>
    <br>
    3) Check you lun masking.<br>
    <br>
    James<br>
  </body>
</html>

--------------060004020707060101010102--
