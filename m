Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q950mjEh021237
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2012 20:48:45 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q950miCJ007473
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2012 20:48:44 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q94Jxjb8016224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 4 Oct 2012 15:59:46 -0400
Message-ID: <506DEAB1.8090707@bmsi.com>
Date: Thu, 04 Oct 2012 15:59:45 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
	<50376BB7.7010008@bmsi.com>
	<CAGQjrKYUdQ5VL4hw+Oo=pgp4d_a9nsQA60gYHXhwVdWKtpX1qQ@mail.gmail.com>
	<503C8ABB.10401@redhat.com>
	<CAGQjrKajQYDc48i+FZhB5zUAJKHtMe4FqSgwx8Ed-z7wRuDVQQ@mail.gmail.com>
	<CAGQjrKYEyBjnZi=vZ4CeT60Cw=SmRJmaiCaoWmekE7qy=01tfg@mail.gmail.com>
In-Reply-To: <CAGQjrKYEyBjnZi=vZ4CeT60Cw=SmRJmaiCaoWmekE7qy=01tfg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------010701070408090607020600"
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
--------------010701070408090607020600
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Let me remind people that on RHEL5, running e2fsck on an ext4 filesystem 
will actually destroy data! Always
use fsck, which runs either e2fsck or e4fsck when e4fsprogs is 
installed.  On newer systems, where ext4 support is not tacked on as 
e4fsprogs, e2fsck handles both (but is it still a good habit to use fsck 
to run the proper checker).

On 10/04/2012 02:32 AM, tariq wali expounded in part:
>
>             resize2fs /dev/vg0/bin-logs
>             resize2fs 1.39 (29-May-2006)
>             resize2fs: Filesystem has unsupported feature(s) while
>             trying to open
>             /dev/vg0/bin-logs
>             Couldn't find valid filesystem superblock.
>
>             #this is where I would get psyched , i did the same thing
>             to all my ext2/3
>             filesystems and have extended file systems online without
>             an issue for
>             years ..but did I fforget the file system type this time ,
>             yes indeed I for
>             got we have started doing ext4 on all our new servers and
>             didn't realise
>             ext4 fancies it's own bells and whistles ..
>
>             I ran the all new resize4fs as suggested by Stuart , and
>             it made my day in
>             fact it made for the whole week's frustration :)
>
>             resize4fs /dev/vg0/logs
>             resize4fs 1.41.12 (17-May-2010)
>             Filesystem at /dev/vg0/logs is mounted on /bin-logs;
>             on-line resizing
>             required
>             old desc_blocks = 7, new_desc_blocks = 9
>             Performing an on-line resize of /dev/vg0/logs to 37408768
>             (4k) blocks.
>
>             The filesystem on /dev/vg0/logs is now 37408768 blocks long.
>


--------------010701070408090607020600
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Let me remind people that on RHEL5,
      running e2fsck on an ext4 filesystem will actually destroy data!&nbsp;
      Always<br>
      use fsck, which runs either e2fsck or e4fsck when e4fsprogs is
      installed.&nbsp; On newer systems, where ext4 support is not tacked on
      as e4fsprogs, e2fsck handles both (but is it still a good habit to
      use fsck to run the proper checker).<br>
      <br>
      On 10/04/2012 02:32 AM, tariq wali expounded in part:<br>
    </div>
    <blockquote
cite="mid:CAGQjrKYEyBjnZi=vZ4CeT60Cw=SmRJmaiCaoWmekE7qy=01tfg@mail.gmail.com"
      type="cite">
      <div dir="ltr"><br>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div>
                <div class="h5">
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0 0 0
                      .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <div>
                          resize2fs /dev/vg0/bin-logs<br>
                          resize2fs 1.39 (29-May-2006)<br>
                          resize2fs: Filesystem has unsupported
                          feature(s) while trying to open<br>
                          /dev/vg0/bin-logs<br>
                          Couldn't find valid filesystem superblock.<br>
                          <br>
                          #this is where I would get psyched , i did the
                          same thing to all my ext2/3<br>
                          filesystems and have extended file systems
                          online without an issue for<br>
                          years ..but did I fforget the file system type
                          this time , yes indeed I for<br>
                          got we have started doing ext4 on all our new
                          servers and didn't realise<br>
                          ext4 fancies it's own bells and whistles ..<br>
                          <br>
                          I ran the all new resize4fs as suggested by
                          Stuart , and it made my day in<br>
                          fact it made for the whole week's frustration
                          :)<br>
                          <br>
                          resize4fs /dev/vg0/logs<br>
                          resize4fs 1.41.12 (17-May-2010)<br>
                          Filesystem at /dev/vg0/logs is mounted on
                          /bin-logs; on-line resizing<br>
                          required<br>
                          old desc_blocks = 7, new_desc_blocks = 9<br>
                          Performing an on-line resize of /dev/vg0/logs
                          to 37408768 (4k) blocks.<br>
                          <br>
                          The filesystem on /dev/vg0/logs is now
                          37408768 blocks long.<br>
                        </div>
                      </blockquote>
                    </blockquote>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010701070408090607020600--
