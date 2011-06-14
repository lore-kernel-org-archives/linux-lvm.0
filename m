Message-ID: <4DF72552.1020809@redhat.com>
Date: Tue, 14 Jun 2011 17:09:38 +0800
From: Mohua Li <moli@redhat.com>
MIME-Version: 1.0
References: <1de306e.5323.12e9958eddf.Coremail.ooolinux@163.com>
In-Reply-To: <1de306e.5323.12e9958eddf.Coremail.ooolinux@163.com>
Content-Type: multipart/alternative;
	boundary="------------090508090706050507030104"
Subject: Re: [linux-lvm] dmsetup do not know sda*
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
Cc: yue <ooolinux@163.com>

This is a multi-part message in MIME format.
--------------090508090706050507030104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

1,if your multipathd service started?

2,how about your multipath.conf, did you blacklist the local disk?

On 03/09/2011 02:41 PM, yue wrote:

> 1.dmsetup ls
> vg_spare-lv_spare       (253, 0)
>   
> why no sda*  device map???
> 2 i install multipath,and configure
> but multipath -ll   show nothing
> ---dmesg---
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> device-mapper: table: 253:1: multipath: error getting device
> device-mapper: ioctl: error adding target to table
> --------
> what i should do?
>   
> thanks
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 


--------------090508090706050507030104
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <pre>1,if your multipathd service started?</pre>
    <pre>
2,how about your multipath.conf, did you blacklist the local disk?</pre>
    <pre>
</pre>
    <pre>
On 03/09/2011 02:41 PM, yue wrote:</pre>
    <blockquote
      cite="mid:1de306e.5323.12e9958eddf.Coremail.ooolinux@163.com"
      type="cite">
      <div>
        <pre>1.dmsetup ls </pre>
      </div>
      <div>
        <pre>vg_spare-lv_spare&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (253, 0)</pre>
      </div>
      <div>
        <pre>&nbsp;</pre>
      </div>
      <div>
        <pre>why no sda*&nbsp; device map???</pre>
      </div>
      <div>
        <pre>2 i install multipath,and configure</pre>
      </div>
      <div>
        <pre>but multipath -ll&nbsp;&nbsp; show nothing</pre>
      </div>
      <div>
        <pre>---dmesg---</pre>
      </div>
      <div>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>device-mapper: table: 253:1: multipath: error getting device</pre>
        <pre>device-mapper: ioctl: error adding target to table</pre>
        <pre>--------</pre>
      </div>
      <div>
        <pre>what i should do?</pre>
      </div>
      <div>
        <pre>&nbsp;</pre>
      </div>
      <div>
        <pre>thanks</pre>
      </div>
      <pre>
</pre>
      <pre><span title="neteasefooter"><span id="netease_mail_footer"></span></span></pre>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre>
</pre>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <pre>
</pre>
    <div class="moz-signature">
      <pre>-- </pre>
    </div>
  </body>
</html>

--------------090508090706050507030104--
