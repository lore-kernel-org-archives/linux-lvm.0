Received: from o.ww.redhat.com (ovpn-204-129.brq.redhat.com [10.40.204.129])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uATKe1E5016450
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 15:40:03 -0500
References: <CAEtPA0CX_3j5du8ScgRCT8DPRiWiW1-Kt5dnHD+JvOePrcWkcg@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <397ce952-3c72-0171-67ed-10e0d94ebe7d@redhat.com>
Date: Tue, 29 Nov 2016 21:40:01 +0100
MIME-Version: 1.0
In-Reply-To: <CAEtPA0CX_3j5du8ScgRCT8DPRiWiW1-Kt5dnHD+JvOePrcWkcg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------5965D1F63640E3F07962F0FF"
Subject: Re: [linux-lvm] Is trim/discard supported on LVM RAID logical
 volume? (resent)
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------5965D1F63640E3F07962F0FF
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Patrick,

this doesn't work in upstream either.

Your old stack with MD raid1 as PV processes ext4 fstrim ok but lvm 
"raid1" does not
(yes, same MD raid runtime used in the kernel driven by the dm-raid target).

Looking into this...

Heinz


On 11/28/2016 08:43 AM, Patrick Dung wrote:
> Hello,
>
> In my old setting, fstrim is supported:
> ext4 over LVM over MD software raid (mdadm) > SSD.
>
> After reading the recommendation in RHEL 6 
> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html
>
> I change to use raid 1 mirror using 'LVM RAID logical volume'. It make 
> use of MD raid internally.
> But I found fstrim does not work anymore. Is the behavior expected?
>
> Thanks and regards,
> Patrick
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------5965D1F63640E3F07962F0FF
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <p>Patrick,</p>
    <p>this doesn't work in upstream either.</p>
    <p>Your old stack with MD raid1 as PV processes ext4 fstrim ok but
      lvm "raid1" does not<br>
      (yes, same MD raid runtime used in the kernel driven by the
      dm-raid target).<br>
    </p>
    <p>Looking into this...</p>
    <p>Heinz<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/28/2016 08:43 AM, Patrick Dung
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAEtPA0CX_3j5du8ScgRCT8DPRiWiW1-Kt5dnHD+JvOePrcWkcg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7669">Hello,<br>
        </div>
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7626"><br>
        </div>
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7627">In
          my old setting, fstrim is supported:</div>
        ext4 over LVM over MD software raid (mdadm) &gt; SSD.<br
          id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7618">
        <br id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7619">
        After reading the recommendation in RHEL 6 <a
          moz-do-not-send="true"
href="https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html">https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html</a><br
          id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7620">
        <br id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7621">
        I change to use raid 1 mirror using 'LVM RAID logical volume'.
        It make use of MD raid internally.<br
          id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7622">
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7635">But
          I found fstrim does not work anymore. Is the behavior
          expected?</div>
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7636"><br>
        </div>
        <div id="gmail-yiv9701195013yui_3_16_0_1_1480154771990_7637">Thanks
          and regards,</div>
        Patrick</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------5965D1F63640E3F07962F0FF--
