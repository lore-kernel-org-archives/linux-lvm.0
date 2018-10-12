Received: from o.ww.redhat.com (ovpn-117-208.ams2.redhat.com [10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B168A0A61
	for <linux-lvm@redhat.com>; Fri, 12 Oct 2018 12:02:24 +0000 (UTC)
References: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
	<20181011142550.GA15437@redhat.com>
	<CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <581cfd57-aca0-70f5-b715-f05357e4bbad@redhat.com>
Date: Fri, 12 Oct 2018 14:02:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------A40BB8806DC96661AC6B7FDC"
Content-Language: en-MW
Subject: Re: [linux-lvm] what is the IOPS behavior when partitions of single
 disk(raid5 backend) are used in an LVM?
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
--------------A40BB8806DC96661AC6B7FDC
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 10/11/18 4:31 PM, Emmanuel Gelati wrote:
> If you use sdb only for data, you don't have need to use partition on 
> the disk.

Though that's true, keeping 1 partition per disk for each LVM PV adds 
additional
'visibility' by tools like fdisk/[cs]fdisk, parted etc. showing the 
partition type to be 'Liinux LVM'.

Using the whole disk, blkid or lsblk will provide that information still,
e.g. 'blkid --match-token TYPE=LVM2_member'.

Heinz

>
> Il giorno gio 11 ott 2018 alle ore 16:26 David Teigland 
> <teigland@redhat.com <mailto:teigland@redhat.com>> ha scritto:
>
>     On Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:
>     > I have LVM(backed by hardware RAID5) with logical volume and a
>     volume group
>     > named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2 sdb3
>     created from
>     > same sdb disk.
>
>     > sdb                                8:16   0  19.7T  0 disk
>     > ├─sdb1                             8:17   0   7.7T  0 part
>     > │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0 lvm 
>     /var/db/st01
>     > ├─sdb2                             8:18   0   1.7T  0 part
>     > │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0 lvm 
>     /var/db/st01
>     > └─sdb3                             8:19   0  10.3T  0 part
>     >   └─archive--archivedbstore--lv (dm-0)     252:0    0 10.3T  0 lvm
>
>     > I am assuming this is due to disk seek problem as the same disk
>     partitions
>     > are used for same LVM or may be its due to saturation of the disks
>
>     You shouldn't add different partitions as different PVs.  If it's
>     too late
>     to fix, it might help to create new LV that uses only one of the
>     partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then
>     copy your
>     current LV to the new one.
>
>     _______________________________________________
>     linux-lvm mailing list
>     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>     https://www.redhat.com/mailman/listinfo/linux-lvm
>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> -- 
>   .~.
>   /V\
>  //  \\
> /(   )\
> ^`~'^
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------A40BB8806DC96661AC6B7FDC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/11/18 4:31 PM, Emmanuel Gelati
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">If you use sdb only for data, you don't have need
        to use partition on the disk.<br>
      </div>
    </blockquote>
    <p>Though that's true, keeping 1 partition per disk for each LVM PV
      adds additional<br>
      'visibility' by tools like fdisk/[cs]fdisk, parted etc. showing
      the partition type to be 'Liinux LVM'.<br>
    </p>
    <p>Using the whole disk, blkid or lsblk will provide that
      information still,<br>
      e.g. 'blkid --match-token TYPE=LVM2_member'.</p>
    <p>Heinz<br>
    </p>
    <blockquote type="cite"
cite="mid:CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr">Il giorno gio 11 ott 2018 alle ore 16:26 David
          Teigland &lt;<a href="mailto:teigland@redhat.com"
            moz-do-not-send="true">teigland@redhat.com</a>&gt; ha
          scritto:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct
          11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:<br>
          &gt; I have LVM(backed by hardware RAID5) with logical volume
          and a volume group<br>
          &gt; named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2
          sdb3 created from<br>
          &gt; same sdb disk.<br>
          <br>
          &gt; sdb                                8:16   0  19.7T  0
          disk<br>
          &gt; ├─sdb1                             8:17   0   7.7T  0
          part<br>
          &gt; │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0
          lvm  /var/db/st01<br>
          &gt; ├─sdb2                             8:18   0   1.7T  0
          part<br>
          &gt; │ └─dbstore-lv (dm-1)              252:1    0   9.4T  0
          lvm  /var/db/st01<br>
          &gt; └─sdb3                             8:19   0  10.3T  0
          part<br>
          &gt;   └─archive--archivedbstore--lv (dm-0)     252:0    0 
          10.3T  0 lvm<br>
          <br>
          &gt; I am assuming this is due to disk seek problem as the
          same disk partitions<br>
          &gt; are used for same LVM or may be its due to saturation of
          the disks<br>
          <br>
          You shouldn't add different partitions as different PVs.  If
          it's too late<br>
          to fix, it might help to create new LV that uses only one of
          the<br>
          partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and then
          copy your<br>
          current LV to the new one.<br>
          <br>
          _______________________________________________<br>
          linux-lvm mailing list<br>
          <a href="mailto:linux-lvm@redhat.com" target="_blank"
            moz-do-not-send="true">linux-lvm@redhat.com</a><br>
          <a href="https://www.redhat.com/mailman/listinfo/linux-lvm"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
          read the LVM HOW-TO at <a
            href="http://tldp.org/HOWTO/LVM-HOWTO/" rel="noreferrer"
            target="_blank" moz-do-not-send="true">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockquote>
      </div>
      <br clear="all">
      <br>
      -- <br>
      <div dir="ltr" class="gmail_signature"
        data-smartmail="gmail_signature">  .~.<br>
          /V\<br>
         //  \\<br>
        /(   )\<br>
        ^`~'^</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <pre class="moz-signature" cols="72">
</pre>
  </body>
</html>

--------------A40BB8806DC96661AC6B7FDC--
