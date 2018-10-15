References: <CACkv3pX-p_a0BKHJ+fXKejE9DM8DagY1DhfE2+fWS9cSmLix4Q@mail.gmail.com>
	<20181011142550.GA15437@redhat.com>
	<CAE7pJ3DZn9H5BXSuTo=uuFfVZQYxYymvzaAN21hCfhA+=AWO5w@mail.gmail.com>
	<581cfd57-aca0-70f5-b715-f05357e4bbad@redhat.com>
	<CACkv3pVvLc5L0QgB0j-vog+O_Lt7+GJLH3ZGzyuk1AK2pvmX=g@mail.gmail.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <ce670e1a-d67b-0651-e829-642ffbc61041@redhat.com>
Date: Mon, 15 Oct 2018 16:48:31 +0200
MIME-Version: 1.0
In-Reply-To: <CACkv3pVvLc5L0QgB0j-vog+O_Lt7+GJLH3ZGzyuk1AK2pvmX=g@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------A7C160E183CD0CB2B6706E4E"
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
To: Sherpa Sherpa <norbuurgen@gmail.com>, linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------A7C160E183CD0CB2B6706E4E
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 10/12/18 5:46 PM, Sherpa Sherpa wrote:
> Thank you for reply i dont mind if fstab sees partitions.  I read this 
> "To avoid striping performance
>  problems LVM can't tell that two PVs are on the same physical disk, so if
> you create a striped LV then the stripes could be on different 
> partitions  on the same disk resulting in a *decrease* in performance 
> rather than an increase." in the tldp.org <http://tldp.org> but does 
> this apply to disks made from RAID backend ?


If you use partitioning, only create one partition per backing device 
and use it as a PV.
This avoids striping across multiple PVs on the same backing device.

The same config flaw (i.e. use multiple partitions on the same backing 
device as PVs thus potentially
stripe across them) may apply to any backing store allowing for 
partitioning.  So don't do it on SW/HW RAID either.

Heinz


>
> Warm Regards
> Urgen Sherpa
>
>
> On Fri, Oct 12, 2018 at 9:09 PM Heinz Mauelshagen <heinzm@redhat.com 
> <mailto:heinzm@redhat.com>> wrote:
>
>     On 10/11/18 4:31 PM, Emmanuel Gelati wrote:
>>     If you use sdb only for data, you don't have need to use
>>     partition on the disk.
>
>     Though that's true, keeping 1 partition per disk for each LVM PV
>     adds additional
>     'visibility' by tools like fdisk/[cs]fdisk, parted etc. showing
>     the partition type to be 'Liinux LVM'.
>
>     Using the whole disk, blkid or lsblk will provide that information
>     still,
>     e.g. 'blkid --match-token TYPE=LVM2_member'.
>
>     Heinz
>
>>
>>     Il giorno gio 11 ott 2018 alle ore 16:26 David Teigland
>>     <teigland@redhat.com <mailto:teigland@redhat.com>> ha scritto:
>>
>>         On Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa wrote:
>>         > I have LVM(backed by hardware RAID5) with logical volume
>>         and a volume group
>>         > named "dbstore-lv" and "dbstore-vg" which have sdb1 sdb2
>>         sdb3 created from
>>         > same sdb disk.
>>
>>         > sdb                                8:16   0 19.7T  0 disk
>>         > ├─sdb1                             8:17   0  7.7T  0 part
>>         > │ └─dbstore-lv (dm-1)              252:1    0  9.4T  0 lvm 
>>         /var/db/st01
>>         > ├─sdb2                             8:18   0  1.7T  0 part
>>         > │ └─dbstore-lv (dm-1)              252:1    0  9.4T  0 lvm 
>>         /var/db/st01
>>         > └─sdb3                             8:19   0 10.3T  0 part
>>         >   └─archive--archivedbstore--lv (dm-0)     252:0   0 
>>         10.3T  0 lvm
>>
>>         > I am assuming this is due to disk seek problem as the same
>>         disk partitions
>>         > are used for same LVM or may be its due to saturation of
>>         the disks
>>
>>         You shouldn't add different partitions as different PVs.  If
>>         it's too late
>>         to fix, it might help to create new LV that uses only one of the
>>         partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2, and
>>         then copy your
>>         current LV to the new one.
>>
>>         _______________________________________________
>>         linux-lvm mailing list
>>         linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>>         https://www.redhat.com/mailman/listinfo/linux-lvm
>>         read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>
>>     -- 
>>       .~.
>>       /V\
>>      //  \\
>>     /(   )\
>>     ^`~'^
>>
>>     _______________________________________________
>>     linux-lvm mailing list
>>     linux-lvm@redhat.com  <mailto:linux-lvm@redhat.com>
>>     https://www.redhat.com/mailman/listinfo/linux-lvm
>>     read the LVM HOW-TO athttp://tldp.org/HOWTO/LVM-HOWTO/
>     _______________________________________________
>     linux-lvm mailing list
>     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
>     https://www.redhat.com/mailman/listinfo/linux-lvm
>     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--------------A7C160E183CD0CB2B6706E4E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/12/18 5:46 PM, Sherpa Sherpa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACkv3pVvLc5L0QgB0j-vog+O_Lt7+GJLH3ZGzyuk1AK2pvmX=g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Thank you for reply i dont mind if fstab sees
        partitions. <span class="gmail-im" style="color:rgb(80,0,80)"> I
          read this "To avoid striping performance<br>
           problems LVM can't tell that two PVs are on the same physical
          disk, so if<br>
          you create a striped LV then the stripes could be on different
          partitions </span> on the same disk resulting in a *decrease*
        in performance rather than an<span class="gmail-im"
          style="color:rgb(80,0,80)"> increase." in the <a
            href="http://tldp.org" moz-do-not-send="true">tldp.org</a>
          but does this apply to disks made from RAID backend ?</span></div>
    </blockquote>
    <p><br>
    </p>
    <p>If you use partitioning, only create one partition per backing
      device and use it as a PV.<br>
      This avoids striping across multiple PVs on the same backing
      device.</p>
    <p>The same config flaw (i.e. use multiple partitions on the same
      backing device as PVs thus potentially<br>
      stripe across them) may apply to any backing store allowing for
      partitioning.  So don't do it on SW/HW RAID either.<br>
    </p>
    <p>Heinz</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACkv3pVvLc5L0QgB0j-vog+O_Lt7+GJLH3ZGzyuk1AK2pvmX=g@mail.gmail.com">
      <div dir="ltr">
        <div>
          <h3 class="gmail-iw"
style="overflow:hidden;white-space:nowrap;max-width:92%;font-size:0.75rem;font-weight:inherit;margin:inherit;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;letter-spacing:0.3px;color:rgb(95,99,104);line-height:20px"><br>
          </h3>
          <div>
            <div dir="ltr" class="m_-8662274235435088732gmail_signature"
              data-smartmail="gmail_signature">
              <div dir="ltr">
                <div>Warm Regards<br>
                </div>
                Urgen Sherpa<br>
              </div>
            </div>
          </div>
          <br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Fri, Oct 12, 2018 at 9:09 PM Heinz Mauelshagen
          &lt;<a href="mailto:heinzm@redhat.com" target="_blank"
            moz-do-not-send="true">heinzm@redhat.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div text="#000000" bgcolor="#FFFFFF">
            <div
              class="m_-8662274235435088732m_-8027134236677368943moz-cite-prefix">On
              10/11/18 4:31 PM, Emmanuel Gelati wrote:<br>
            </div>
            <blockquote type="cite">
              <div dir="ltr">If you use sdb only for data, you don't
                have need to use partition on the disk.<br>
              </div>
            </blockquote>
            <p>Though that's true, keeping 1 partition per disk for each
              LVM PV adds additional<br>
              'visibility' by tools like fdisk/[cs]fdisk, parted etc.
              showing the partition type to be 'Liinux LVM'.<br>
            </p>
            <p>Using the whole disk, blkid or lsblk will provide that
              information still,<br>
              e.g. 'blkid --match-token TYPE=LVM2_member'.</p>
            <p>Heinz<br>
            </p>
            <blockquote type="cite"><br>
              <div class="gmail_quote">
                <div dir="ltr">Il giorno gio 11 ott 2018 alle ore 16:26
                  David Teigland &lt;<a
                    href="mailto:teigland@redhat.com" target="_blank"
                    moz-do-not-send="true">teigland@redhat.com</a>&gt;
                  ha scritto:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">On
                  Thu, Oct 11, 2018 at 08:53:07AM +0545, Sherpa Sherpa
                  wrote:<br>
                  &gt; I have LVM(backed by hardware RAID5) with logical
                  volume and a volume group<br>
                  &gt; named "dbstore-lv" and "dbstore-vg" which have
                  sdb1 sdb2 sdb3 created from<br>
                  &gt; same sdb disk.<br>
                  <br>
                  &gt; sdb                                8:16   0 
                  19.7T  0 disk<br>
                  &gt; ├─sdb1                             8:17   0 
                   7.7T  0 part<br>
                  &gt; │ └─dbstore-lv (dm-1)              252:1    0 
                   9.4T  0 lvm  /var/db/st01<br>
                  &gt; ├─sdb2                             8:18   0 
                   1.7T  0 part<br>
                  &gt; │ └─dbstore-lv (dm-1)              252:1    0 
                   9.4T  0 lvm  /var/db/st01<br>
                  &gt; └─sdb3                             8:19   0 
                  10.3T  0 part<br>
                  &gt;   └─archive--archivedbstore--lv (dm-0)     252:0 
                    0  10.3T  0 lvm<br>
                  <br>
                  &gt; I am assuming this is due to disk seek problem as
                  the same disk partitions<br>
                  &gt; are used for same LVM or may be its due to
                  saturation of the disks<br>
                  <br>
                  You shouldn't add different partitions as different
                  PVs.  If it's too late<br>
                  to fix, it might help to create new LV that uses only
                  one of the<br>
                  partitions, e.g. lvcreate -n lv -L size vg /dev/sdb2,
                  and then copy your<br>
                  current LV to the new one.<br>
                  <br>
                  _______________________________________________<br>
                  linux-lvm mailing list<br>
                  <a href="mailto:linux-lvm@redhat.com" target="_blank"
                    moz-do-not-send="true">linux-lvm@redhat.com</a><br>
                  <a
                    href="https://www.redhat.com/mailman/listinfo/linux-lvm"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
                  read the LVM HOW-TO at <a
                    href="http://tldp.org/HOWTO/LVM-HOWTO/"
                    rel="noreferrer" target="_blank"
                    moz-do-not-send="true">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockquote>
              </div>
              <br clear="all">
              <br>
              -- <br>
              <div dir="ltr"
                class="m_-8662274235435088732m_-8027134236677368943gmail_signature"
                data-smartmail="gmail_signature">  .~.<br>
                  /V\<br>
                 //  \\<br>
                /(   )\<br>
                ^`~'^</div>
              <br>
              <fieldset
                class="m_-8662274235435088732m_-8027134236677368943mimeAttachmentHeader"></fieldset>
              <pre class="m_-8662274235435088732m_-8027134236677368943moz-quote-pre">_______________________________________________
linux-lvm mailing list
<a class="m_-8662274235435088732m_-8027134236677368943moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com" target="_blank" moz-do-not-send="true">linux-lvm@redhat.com</a>
<a class="m_-8662274235435088732m_-8027134236677368943moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank" moz-do-not-send="true">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="m_-8662274235435088732m_-8027134236677368943moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank" moz-do-not-send="true">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
            </blockquote>
          </div>
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
    </blockquote>
    <pre class="moz-signature" cols="72">
</pre>
  </body>
</html>

--------------A7C160E183CD0CB2B6706E4E--
