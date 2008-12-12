Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBCCaONC017654
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 07:36:24 -0500
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.179])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBCCZlVF014772
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 07:35:47 -0500
Received: by wa-out-1112.google.com with SMTP id j4so695267wah.19
	for <linux-lvm@redhat.com>; Fri, 12 Dec 2008 04:35:46 -0800 (PST)
Message-ID: <b2a58a4c0812120435jca6a842m13a389a5aa6d27e3@mail.gmail.com>
Date: Fri, 12 Dec 2008 20:35:46 +0800
From: "yuan yuan" <duanyuan0526@163.com>
Sender: yuanyuan0526@gmail.com
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_126465_32565973.1229085346572"
Subject: [linux-lvm] A question about the metadata circular buffer
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_126465_32565973.1229085346572
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys

     I have been reading the source code of lvm2 recently and met a
question.

     In the file lib/format_text/format-text.c :

      static int _vg_write_raw(struct format_instance *fid, struct
volume_group *vg,
                         struct metadata_area *mda)
{
 .....
    if ((new_wrap && old_wrap) ||
            (rlocn && (new_wrap || old_wrap) && (new_end > rlocn->offset))
||
            (mdac->rlocn.size >= mdah->size)) {
                log_error("VG %s metadata too large for circular buffer",
                          vg->name);
                goto out;
        }
......
}

My question is , for a circular buffer, why should we check so many
conditions instead of just checking (mdac->rlocn.size >= mdah->size)?
forgive my poor english. 3ks

------=_Part_126465_32565973.1229085346572
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys<br><br>&nbsp;&nbsp;&nbsp;&nbsp; I have been reading the source code of lvm2 recently and met a question.<br><br>&nbsp;&nbsp;&nbsp;&nbsp; In the file lib/format_text/format-text.c :<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static int _vg_write_raw(struct format_instance *fid, struct volume_group *vg,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct metadata_area *mda)<br>{<br>&nbsp;.....<br>&nbsp;&nbsp;&nbsp; if ((new_wrap &amp;&amp; old_wrap) ||<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (rlocn &amp;&amp; (new_wrap || old_wrap) &amp;&amp; (new_end &gt; rlocn-&gt;offset)) ||<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (mdac-&gt;rlocn.size &gt;= mdah-&gt;size)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_error(&quot;VG %s metadata too large for circular buffer&quot;,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg-&gt;name);<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>......<br>}<br><br>My question is , for a circular buffer, why should we check so many conditions instead of just checking (mdac-&gt;rlocn.size &gt;= mdah-&gt;size)?<br>
forgive my poor english. 3ks<br><br>

------=_Part_126465_32565973.1229085346572--
