Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9724418A5E
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 10:07:51 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79BD519CBF7
	for <linux-lvm@redhat.com>; Mon,  5 Feb 2018 10:07:44 +0000 (UTC)
References: <CAPE0SYxuLG3sqoaez=CV4ZjQEcB+iqzB+CM7q6jrLg9z+L6kzQ@mail.gmail.com>
	<38d3b050-7cc7-66cb-5579-5513a5d7b37e@suse.com>
	<CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com>
From: Eric Ren <zren@suse.com>
Message-ID: <751587bf-42df-796d-e772-3fbfbc220db7@suse.com>
Date: Mon, 5 Feb 2018 18:07:20 +0800
MIME-Version: 1.0
In-Reply-To: <CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------9E331B9006DC41B862D2F019"
Content-Language: en-US
Subject: Re: [linux-lvm] Unsync-ed LVM Mirror
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
To: Liwei <xieliwei@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------9E331B9006DC41B862D2F019
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Hi,

On 02/05/2018 03:42 PM, Liwei wrote:
> Hi Eric,
>     Thanks for answering! Here are the details:
>
> # lvm version
>   LVM version:     2.02.176(2) (2017-11-03)
>   Library version: 1.02.145 (2017-11-03)
>   Driver version:  4.37.0
>   Configuration:   ./configure --build=x86_64-linux-gnu --prefix=/usr 
> --includedir=${prefix}/include --mandir=${prefix}/share/man 
> --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var 
> --disable-silent-rules --libdir=${prefix}/lib/x86_64-linux-gnu 
> --libexecdir=${prefix}/lib/x86_64-linux-gnu --runstatedir=/run 
> --disable-maintainer-mode --disable-dependency-tracking --exec-prefix= 
> --bindir=/bin --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin 
> --with-usrlibdir=/usr/lib/x86_64-linux-gnu --with-optimisation=-O2 
> --with-cache=internal --with-clvmd=corosync --with-cluster=internal 
> --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 
> --with-default-pid-dir=/run --with-default-run-dir=/run/lvm 
> --with-default-locking-dir=/run/lock/lvm --with-thin=internal 
> --with-thin-check=/usr/sbin/thin_check 
> --with-thin-dump=/usr/sbin/thin_dump 
> --with-thin-repair=/usr/sbin/thin_repair --enable-applib 
> --enable-blkid_wiping --enable-cmdlib --enable-cmirrord 
> --enable-dmeventd --enable-dbus-service --enable-lvmetad 
> --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld 
> --enable-notify-dbus --enable-pkgconfig --enable-readline 
> --enable-udev_rules --enable-udev_sync
>
> # uname -a
> Linux dataserv 4.14.0-3-amd64 #1 SMP Debian 4.14.13-1 (2018-01-14) 
> x86_64 GNU/Linux

Sorry, I'm not sure if this the root cause of your issue, without 
testing myself. If you have interest to
have a try, you can revert

cd15fb64ee56192760ad5c1e2ad97a65e735b18b (Revert "dm mirror: use all 
available legs on multiple failures")

and try my patch in https://patchwork.kernel.org/patch/9808897/


The "reverting" fix for the crash issue is in 4.14.0 kernel.
'""
╭─eric@ws ~/workspace/linux  ‹master›
╰─$ git log --grep "Revert \"dm mirror: use all available legs on 
multiple failures\""

commit cd15fb64ee56192760ad5c1e2ad97a65e735b18b
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Thu Jun 15 08:39:15 2017 -0400

     Revert "dm mirror: use all available legs on multiple failures"

     This reverts commit 12a7cf5ba6c776a2621d8972c7d42e8d3d959d20.

╭─eric@ws ~/workspace/linux  ‹master›
╰─$ git describe cd15fb64ee56192760ad5c1e2ad97a65e735b18b
v4.12-rc5-2-gcd15fb64ee56
"""

Eric

>
> Warm regards,
> Liwei
>
> On 5 Feb 2018 15:27, "Eric Ren" <zren@suse.com <mailto:zren@suse.com>> 
> wrote:
>
>     Hi,
>
>     Your LVM version and kernel version please?
>
>     like:
>     """"
>     # lvm version
>       LVM version:     2.02.177(2) (2017-12-18)
>       Library version: 1.03.01 (2017-12-18)
>       Driver version:  4.35.0
>
>     # uname -a
>     Linux sle15-c1-n1 4.12.14-9.1-default #1 SMP Fri Jan 19 09:13:51
>     UTC 2018 (849a2fe) x86_64 x86_64 x86_64 GNU/Linux
>     """
>
>     Eric
>
>     On 02/03/2018 05:43 PM, Liwei wrote:
>
>         Hi list,
>              I had a LV that I was converting from linear to mirrored (not
>         raid1) whose source device failed partway-through during the
>         initial
>         sync.
>
>              I've since recovered the source device, but it seems like the
>         mirror is still acting as if some blocks are not readable? I'm
>         getting
>         this in my logs, and the FS is full of errors:
>
>         [  +1.613126] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.000278] device-mapper: raid1: Primary mirror (253:25) failed
>         while out-of-sync: Reads may fail.
>         [  +0.085916] device-mapper: raid1: Mirror read failed.
>         [  +0.196562] device-mapper: raid1: Mirror read failed.
>         [  +0.000237] Buffer I/O error on dev dm-27, logical block
>         5371800560,
>         async page read
>         [  +0.592135] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.082882] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.246945] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.107374] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.083344] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.114949] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.085056] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.203929] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.157953] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +3.065247] recovery_complete: 23 callbacks suppressed
>         [  +0.000001] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.128064] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.103100] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.107827] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.140871] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.132844] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.124698] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.138502] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.117827] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [  +0.125705] device-mapper: raid1: Unable to read primary mirror
>         during recovery
>         [Feb 3 17:09] device-mapper: raid1: Mirror read failed.
>         [  +0.167553] device-mapper: raid1: Mirror read failed.
>         [  +0.000268] Buffer I/O error on dev dm-27, logical block
>         5367765816,
>         async page read
>         [  +0.135138] device-mapper: raid1: Mirror read failed.
>         [  +0.000238] Buffer I/O error on dev dm-27, logical block
>         5367765816,
>         async page read
>         [  +0.000365] device-mapper: raid1: Mirror read failed.
>         [  +0.000315] device-mapper: raid1: Mirror read failed.
>         [  +0.000213] Buffer I/O error on dev dm-27, logical block
>         5367896888,
>         async page read
>         [  +0.000276] device-mapper: raid1: Mirror read failed.
>         [  +0.000199] Buffer I/O error on dev dm-27, logical block
>         5367765816,
>         async page read
>
>              However, if I take down the destination device and
>         restart the LV
>         with --activateoption partial, I can read my data and everything
>         checks out.
>
>              My theory (and what I observed) is that lvm continued the
>         initial
>         sync even after the source drive stopped responding, and has now
>         mapped the blocks that it 'synced' as dead. How can I make lvm
>         retry
>         those blocks again?
>
>              In fact, I don't trust the mirror anymore, is there a way
>         I can
>         conduct a scrub of the mirror after the initial sync is done?
>         I read
>         about --syncaction check, but seems like it only notes the
>         number of
>         inconsistencies. Can I have lvm re-mirror the inconsistencies
>         from the
>         source to destination device? I trust the source device
>         because we ran
>         a btrfs scrub on it and it reported that all checksums are valid.
>
>              It took months for the mirror sync to get to this stage
>         (actually,
>         why does it take months to mirror 20TB?), I don't want to
>         start it all
>         over again.
>
>         Warm regards,
>         Liwei
>
>         _______________________________________________
>         linux-lvm mailing list
>         linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>         https://www.redhat.com/mailman/listinfo/linux-lvm
>         <https://www.redhat.com/mailman/listinfo/linux-lvm>
>         read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>         <http://tldp.org/HOWTO/LVM-HOWTO/>
>
>


--------------9E331B9006DC41B862D2F019
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">On 02/05/2018 03:42 PM, Liwei wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com">
      <div dir="auto">Hi Eric,
        <div dir="auto">    Thanks for answering! Here are the details:</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto"># lvm version
          <div dir="auto">  LVM version:     2.02.176(2) (2017-11-03)</div>
          <div dir="auto">  Library version: 1.02.145 (2017-11-03)</div>
          <div dir="auto">  Driver version:  4.37.0</div>
          <div dir="auto">  Configuration:   ./configure
            --build=x86_64-linux-gnu --prefix=/usr
            --includedir=${prefix}/include --mandir=${prefix}/share/man
            --infodir=${prefix}/share/info --sysconfdir=/etc
            --localstatedir=/var --disable-silent-rules
            --libdir=${prefix}/lib/x86_64-linux-gnu
            --libexecdir=${prefix}/lib/x86_64-linux-gnu
            --runstatedir=/run --disable-maintainer-mode
            --disable-dependency-tracking --exec-prefix= --bindir=/bin
            --libdir=/lib/x86_64-linux-gnu --sbindir=/sbin
            --with-usrlibdir=/usr/lib/x86_64-linux-gnu
            --with-optimisation=-O2 --with-cache=internal
            --with-clvmd=corosync --with-cluster=internal
            --with-device-uid=0 --with-device-gid=6
            --with-device-mode=0660 --with-default-pid-dir=/run
            --with-default-run-dir=/run/lvm
            --with-default-locking-dir=/run/lock/lvm
            --with-thin=internal --with-thin-check=/usr/sbin/thin_check
            --with-thin-dump=/usr/sbin/thin_dump
            --with-thin-repair=/usr/sbin/thin_repair --enable-applib
            --enable-blkid_wiping --enable-cmdlib --enable-cmirrord
            --enable-dmeventd --enable-dbus-service --enable-lvmetad
            --enable-lvmlockd-dlm --enable-lvmlockd-sanlock
            --enable-lvmpolld --enable-notify-dbus --enable-pkgconfig
            --enable-readline --enable-udev_rules --enable-udev_sync</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto"># uname -a<br>
          </div>
          <div dir="auto">Linux dataserv 4.14.0-3-amd64 #1 SMP Debian
            4.14.13-1 (2018-01-14) x86_64 GNU/Linux</div>
        </div>
      </div>
    </blockquote>
    <br>
    Sorry, I'm not sure if this the root cause of your issue, without
    testing myself. If you have interest to<br>
    have a try, you can revert<br>
    <br>
    cd15fb64ee56192760ad5c1e2ad97a65e735b18b (Revert "dm mirror: use all
    available legs on multiple failures")<br>
    <br>
    and try my patch in <a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/patch/9808897/">https://patchwork.kernel.org/patch/9808897/</a><br>
    <br>
    <br>
    The "reverting" fix for the crash issue is in 4.14.0 kernel.<br>
    '""<br>
    ╭─eric@ws ~/workspace/linux  ‹master› <br>
    ╰─$ git log --grep "Revert \"dm mirror: use all available legs on
    multiple failures\""<br>
    <br>
    commit cd15fb64ee56192760ad5c1e2ad97a65e735b18b<br>
    Author: Mike Snitzer <a class="moz-txt-link-rfc2396E" href="mailto:snitzer@redhat.com">&lt;snitzer@redhat.com&gt;</a><br>
    Date:   Thu Jun 15 08:39:15 2017 -0400<br>
    <br>
        Revert "dm mirror: use all available legs on multiple failures"<br>
        <br>
        This reverts commit 12a7cf5ba6c776a2621d8972c7d42e8d3d959d20.<br>
    <br>
    ╭─eric@ws ~/workspace/linux  ‹master› <br>
    ╰─$ git describe cd15fb64ee56192760ad5c1e2ad97a65e735b18b<br>
    v4.12-rc5-2-gcd15fb64ee56<br>
    """<br>
    <br>
    Eric<br>
    <br>
    <blockquote type="cite"
cite="mid:CAPE0SYxR2NtM_vdrqSMBsy==YT2MF8we_Q+HJ9Upeb6an2PLpQ@mail.gmail.com">
      <div dir="auto">
        <div dir="auto">
          <div dir="auto"><br>
          </div>
          <div dir="auto">Warm regards, </div>
          <div dir="auto">Liwei</div>
        </div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 5 Feb 2018 15:27, "Eric Ren" &lt;<a
            href="mailto:zren@suse.com" moz-do-not-send="true">zren@suse.com</a>&gt;
          wrote:<br type="attribution">
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
            <br>
            Your LVM version and kernel version please?<br>
            <br>
            like:<br>
            """"<br>
            # lvm version<br>
              LVM version:     2.02.177(2) (2017-12-18)<br>
              Library version: 1.03.01 (2017-12-18)<br>
              Driver version:  4.35.0<br>
            <br>
            # uname -a<br>
            Linux sle15-c1-n1 4.12.14-9.1-default #1 SMP Fri Jan 19
            09:13:51 UTC 2018 (849a2fe) x86_64 x86_64 x86_64 GNU/Linux<br>
            """<br>
            <br>
            Eric<br>
            <br>
            On 02/03/2018 05:43 PM, Liwei wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Hi list,<br>
                   I had a LV that I was converting from linear to
              mirrored (not<br>
              raid1) whose source device failed partway-through during
              the initial<br>
              sync.<br>
              <br>
                   I've since recovered the source device, but it seems
              like the<br>
              mirror is still acting as if some blocks are not readable?
              I'm getting<br>
              this in my logs, and the FS is full of errors:<br>
              <br>
              [  +1.613126] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.000278] device-mapper: raid1: Primary mirror
              (253:25) failed<br>
              while out-of-sync: Reads may fail.<br>
              [  +0.085916] device-mapper: raid1: Mirror read failed.<br>
              [  +0.196562] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000237] Buffer I/O error on dev dm-27, logical block
              5371800560,<br>
              async page read<br>
              [  +0.592135] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.082882] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.246945] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.107374] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.083344] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.114949] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.085056] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.203929] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.157953] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +3.065247] recovery_complete: 23 callbacks suppressed<br>
              [  +0.000001] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.128064] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.103100] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.107827] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.140871] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.132844] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.124698] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.138502] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.117827] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [  +0.125705] device-mapper: raid1: Unable to read primary
              mirror<br>
              during recovery<br>
              [Feb 3 17:09] device-mapper: raid1: Mirror read failed.<br>
              [  +0.167553] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000268] Buffer I/O error on dev dm-27, logical block
              5367765816,<br>
              async page read<br>
              [  +0.135138] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000238] Buffer I/O error on dev dm-27, logical block
              5367765816,<br>
              async page read<br>
              [  +0.000365] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000315] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000213] Buffer I/O error on dev dm-27, logical block
              5367896888,<br>
              async page read<br>
              [  +0.000276] device-mapper: raid1: Mirror read failed.<br>
              [  +0.000199] Buffer I/O error on dev dm-27, logical block
              5367765816,<br>
              async page read<br>
              <br>
                   However, if I take down the destination device and
              restart the LV<br>
              with --activateoption partial, I can read my data and
              everything<br>
              checks out.<br>
              <br>
                   My theory (and what I observed) is that lvm continued
              the initial<br>
              sync even after the source drive stopped responding, and
              has now<br>
              mapped the blocks that it 'synced' as dead. How can I make
              lvm retry<br>
              those blocks again?<br>
              <br>
                   In fact, I don't trust the mirror anymore, is there a
              way I can<br>
              conduct a scrub of the mirror after the initial sync is
              done? I read<br>
              about --syncaction check, but seems like it only notes the
              number of<br>
              inconsistencies. Can I have lvm re-mirror the
              inconsistencies from the<br>
              source to destination device? I trust the source device
              because we ran<br>
              a btrfs scrub on it and it reported that all checksums are
              valid.<br>
              <br>
                   It took months for the mirror sync to get to this
              stage (actually,<br>
              why does it take months to mirror 20TB?), I don't want to
              start it all<br>
              over again.<br>
              <br>
              Warm regards,<br>
              Liwei<br>
              <br>
              ______________________________<wbr>_________________<br>
              linux-lvm mailing list<br>
              <a href="mailto:linux-lvm@redhat.com" target="_blank"
                moz-do-not-send="true">linux-lvm@redhat.com</a><br>
              <a
                href="https://www.redhat.com/mailman/listinfo/linux-lvm"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.redhat.com/mailman<wbr>/listinfo/linux-lvm</a><br>
              read the LVM HOW-TO at <a
                href="http://tldp.org/HOWTO/LVM-HOWTO/" rel="noreferrer"
                target="_blank" moz-do-not-send="true">http://tldp.org/HOWTO/LVM-HOWT<wbr>O/</a><br>
              <br>
            </blockquote>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9E331B9006DC41B862D2F019--
