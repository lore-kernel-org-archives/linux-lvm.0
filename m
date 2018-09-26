Received: from o.ww.redhat.com (unknown [10.40.205.124])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 369F66B644
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2018 16:00:30 +0000 (UTC)
References: <f76497b5-d38f-b6c7-afe7-1615241c08c3@redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <1bc84954-15e9-7e98-20c5-865d0381d639@redhat.com>
Date: Wed, 26 Sep 2018 18:00:28 +0200
MIME-Version: 1.0
In-Reply-To: <f76497b5-d38f-b6c7-afe7-1615241c08c3@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------3D81839BE87904C9C36D5DAC"
Content-Language: en-MW
Subject: [linux-lvm] Fwd: Re:  Correct way to remove LVM Snapshot
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
--------------3D81839BE87904C9C36D5DAC
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/18 6:50 AM, Jaco van Niekerk wrote:
>
> Hi
>
> I will like to confirm the correct way to remove an LVM snapshot?
>
> Create my Logical Volume and snapshot:
> lvcreate --addtag pacemaker --name lv_iscsi_lun1 --size 100G vg_iscsi 
> --config 'activation { volume_list = [ "@pacemaker" ]}'
> lvcreate --addtag pacemaker --name lv_iscsi_lun1_snap --snapshot 
> --size 10G /dev/vg_iscsi/lv_iscsi_lun1 --config 'activation { 
> volume_list = [ \"@pacemaker\" ]}'
>
> Do I have to Merge the Snapshot first before I can remove it?
> lvremove /dev/vg_iscsi/lv_iscsi_lun1_snap


Depends on your use case:

- if you need the data as of your snapshot and wnat to keep it in the 
origin, you have to merge

- if you used the snapshot temorarily (e.g. for backup, fsck, ...), just 
lvremove it.

>
> More Info:
> lv_iscsi_lun1 is a ISCSI target for a KVM virtual server.
>
> Trouble experienced:
> I lost my hole Volume Group after removing the Logical Volume Snapshot.

Can you provide any logs and "lvremove -vvvv ..." output (lvmdump 
preferred)?

Heinz

> Regards
>
> -- 
>
> Jaco van Niekerk
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO athttp://tldp.org/HOWTO/LVM-HOWTO/

--------------3D81839BE87904C9C36D5DAC
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 9/26/18 6:50 AM, Jaco van Niekerk wrote:
    <div class="moz-forward-container">
      <blockquote type="cite"
cite="mid:83AC2A1B573A1341BD85C441C9109F5928EF35C7@desktoptdc.desktop.local">
        <meta http-equiv="Content-Type" content="text/html;
          charset=windows-1252">
        <p>Hi</p>
        <p>I will like to confirm the correct way to remove an LVM
          snapshot?</p>
        Create my Logical Volume and snapshot:<br>
        lvcreate --addtag pacemaker --name lv_iscsi_lun1 --size 100G
        vg_iscsi --config 'activation { volume_list = [ "@pacemaker" ]}'<br>
        lvcreate --addtag pacemaker --name lv_iscsi_lun1_snap --snapshot
        --size 10G /dev/vg_iscsi/lv_iscsi_lun1 --config 'activation {
        volume_list = [ \"@pacemaker\" ]}'<br>
        <br>
        Do I have to Merge the Snapshot first before I can remove it?<br>
        lvremove /dev/vg_iscsi/lv_iscsi_lun1_snap<br>
      </blockquote>
      <p><br>
      </p>
      <p>Depends on your use case:<br>
      </p>
      <p>- if you need the data as of your snapshot and wnat to keep it
        in the origin, you have to merge</p>
      <p>- if you used the snapshot temorarily (e.g. for backup, fsck,
        ...), just lvremove it.</p>
      <blockquote type="cite"
cite="mid:83AC2A1B573A1341BD85C441C9109F5928EF35C7@desktoptdc.desktop.local"><br>
        More Info:<br>
        lv_iscsi_lun1 is a ISCSI target for a KVM virtual server.<br>
        <br>
        Trouble experienced:<br>
        I lost my hole Volume Group after removing the Logical Volume
        Snapshot. <br>
      </blockquote>
      <p>Can you provide any logs and "lvremove -vvvv ..." output
        (lvmdump preferred)?<br>
      </p>
      <p>Heinz<br>
      </p>
      <blockquote type="cite"
cite="mid:83AC2A1B573A1341BD85C441C9109F5928EF35C7@desktoptdc.desktop.local">
        <p>Regards<br>
        </p>
        <div class="moz-signature">-- <br>
          <p style="font-family: Arial; background-color: rgb(255,&#xA;
            255,&#xA; 255); margin-bottom: 6pt; margin-top: 6pt;"> <span
              style="font-size: 13.3333px;">Jaco van Niekerk</span></p>
          <br>
        </div>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com" moz-do-not-send="true">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm" moz-do-not-send="true">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/" moz-do-not-send="true">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
      </blockquote>
    </div>
  </body>
</html>

--------------3D81839BE87904C9C36D5DAC--
