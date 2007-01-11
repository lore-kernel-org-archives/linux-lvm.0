Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0B77rhE019194
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 02:07:53 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.236])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0B77NW8008162
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 02:07:52 -0500
Received: by wr-out-0506.google.com with SMTP id i28so251725wra
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 23:07:52 -0800 (PST)
Message-ID: <5adb39f00701102307tebf5624sd2656d17b87978a3@mail.gmail.com>
Date: Wed, 10 Jan 2007 23:07:52 -0800
From: "David Tran" <davidtt3@gmail.com>
Subject: Re: [linux-lvm] lvextend Insufficient free space
In-Reply-To: <be7468bb0701101741h6ef6adacs38bb89d134fcf890@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_19501_12507578.1168499272500"
References: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
	<be7468bb0701101741h6ef6adacs38bb89d134fcf890@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_19501_12507578.1168499272500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank for your help.
My pvs:
linux-server:/ # pvscan
  PV /dev/hdb1   VG gdata   lvm2 [111.79 GB / 0    free]
  PV /dev/hde1   VG gdata   lvm2 [279.46 GB / 40.00 MB free]
  PV /dev/hdf1   VG gdata   lvm2 [153.38 GB / 153.38 GB free] (this is the
new hd)
  Total: 3 [544.62 GB] / in use: 3 [544.62 GB] / in no VG: 0 [0   ]
I think that it is enogh free space, because I add one more HD already.
More over, vgdisplay show it has: Free  PE / Size       39276 / 153.42 GB

Thank you.


On 1/10/07, roderick tapang <retapang@gmail.com> wrote:
>
> On 1/9/07, David Tran <davidtt3@gmail.com> wrote:
> >   Cur PV                3
> >   Act PV                3
> >   VG Size               544.62 GB
> >   PE Size               4.00 MB
> >   Total PE              139424
> >   Alloc PE / Size       100148 / 391.20 GB
> >   Free  PE / Size       39276 / 153.42 GB
> >   VG UUID
> > gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD
> > -------------------------------------------------------------
> > /////// So I have 153.42 GB free space NOW
> > -------------------------------------------------------------
> > linux-server:/ # lvextend -L +100G /dev/gdata/priv
> >   Extending logical volume priv to 177.80 GB
> >   Insufficient free space: 45517 extents needed, but only 39276
> available
>
> is /dev/gdata/priv striped? if it is, it looks like the PVs don't have
> enough PEs each to accommodate equal stripe distribution.
> wha'ts the output of "pvs"?
>
> --
> roderick e. tapang, nclp
> retapang at gmail dot com
>
> (o_.'       http://counter.li.org/
> //\         ----------------------
> V_/_        Linux User   #  253842
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_19501_12507578.1168499272500
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank for your help.<br>My pvs:<br>linux-server:/ # pvscan<br>&nbsp; PV /dev/hdb1&nbsp;&nbsp; VG gdata&nbsp;&nbsp; lvm2 [111.79 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/hde1&nbsp;&nbsp; VG gdata&nbsp;&nbsp; lvm2 [279.46 GB / 40.00 MB free]<br>&nbsp;<span style="color: rgb(255, 0, 0);">
 <span style="font-weight: bold;">PV /dev/hdf1&nbsp;&nbsp; VG gdata&nbsp;&nbsp; lvm2 [153.38 GB / 153.38 GB free] (this is the new hd)</span></span><br>&nbsp; Total: 3 [544.62 GB] / in use: 3 [544.62 GB] / in no VG: 0 [0&nbsp;&nbsp; ]<br>I think that it is enogh free space, because I add one more HD already.
<br>More over, vgdisplay show it has:<span style="font-weight: bold; color: rgb(51, 102, 255);"> Free&nbsp;&nbsp;PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 39276 / 153.42 GB</span><br><br>Thank you.<br><br><br><div><span class="gmail_quote">On 1/10/07, <b class="gmail_sendername">
roderick tapang</b> &lt;<a href="mailto:retapang@gmail.com">retapang@gmail.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On 1/9/07, David Tran &lt;<a href="mailto:davidtt3@gmail.com">davidtt3@gmail.com</a>&gt; wrote:<br>&gt;&nbsp;&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3<br>&gt;&nbsp;&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3<br>&gt;&nbsp;&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 544.62 GB<br>&gt;&nbsp;&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
4.00 MB<br>&gt;&nbsp;&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;139424<br>&gt;&nbsp;&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100148 / 391.20 GB<br>&gt;&nbsp;&nbsp; Free&nbsp;&nbsp;PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 39276 / 153.42 GB<br>&gt;&nbsp;&nbsp; VG UUID<br>&gt; gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD<br>&gt; -------------------------------------------------------------
<br>&gt; /////// So I have 153.42 GB free space NOW<br>&gt; -------------------------------------------------------------<br>&gt; linux-server:/ # lvextend -L +100G /dev/gdata/priv<br>&gt;&nbsp;&nbsp; Extending logical volume priv to 
177.80 GB<br>&gt;&nbsp;&nbsp; Insufficient free space: 45517 extents needed, but only 39276 available<br><br>is /dev/gdata/priv striped? if it is, it looks like the PVs don&#39;t have<br>enough PEs each to accommodate equal stripe distribution.
<br>wha&#39;ts the output of &quot;pvs&quot;?<br><br>--<br>roderick e. tapang, nclp<br>retapang at gmail dot com<br><br>(o_.&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://counter.li.org/">http://counter.li.org/</a><br>//\&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ----------------------
<br>V_/_&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Linux User&nbsp;&nbsp; #&nbsp;&nbsp;253842<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">
https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_19501_12507578.1168499272500--
