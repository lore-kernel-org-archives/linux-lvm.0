Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1D94TwU005463
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 04:04:29 -0500
Received: from ag-out-0708.google.com (ag-out-0708.google.com [72.14.246.241])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m1D943df029093
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 04:04:03 -0500
Received: by ag-out-0708.google.com with SMTP id 31so13852215agc.3
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 01:04:03 -0800 (PST)
Message-ID: <b646832c0802130104i7d8eb37fkb61d49c5127f316b@mail.gmail.com>
Date: Wed, 13 Feb 2008 14:34:02 +0530
From: "=?UTF-8?Q?Yajith_Ajantha_Dayarath?=
	=?UTF-8?Q?na_|_=E0=B6=BA=E0=B6=A2=E0=B7=92=E0=B6=AD=E0=B7=8A_=E0=B6=85?=
	=?UTF-8?Q?=E0=B6=A2=E0=B6=B1=E0=B7=8A=E0=B6=AD_=E0=B6=AF?=
	=?UTF-8?Q?=E0=B6=BA=E0=B7=8F=E0=B6=BB=E0=B6=AD=E0=B7=8A=E0=B6=B1?="
	<yajith@gmail.com>
Subject: Re: [linux-lvm] pvcreate problem
In-Reply-To: <47B2AC45.6030901@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_21479_11582493.1202893442287"
References: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>
	<47B2AC45.6030901@redhat.com>
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

------=_Part_21479_11582493.1202893442287
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Feb 13, 2008 2:07 PM, Mark Huth <mhuth@redhat.com> wrote:

> Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:
> > Hi all,
> > Forgive me if this is the wrong list to ask this question.
> > I'm quite new to LVM(-and to this list) and one of my friends brought
> > this question up to me..
> >
> > There is an error coming up when they try to "pvcreate"
> >
> > Below is the "fdisk -l" output.
> >
> > [root@lwlsvr bin]# fdisk -l
> >
> >
> > Disk /dev/cciss/c0d0: 145.6 GB, 145667358720 bytes
> > 255 heads, 32 sectors/track, 34866 cylinders
> > Units = cylinders of 8160 * 512 = 4177920 bytes
> >
> > Device Boot Start End Blocks Id System
> > /dev/cciss/c0d0p1 * 1 25 101984 83 Linux
> > /dev/cciss/c0d0p2 26 7554 30718320 83 Linux
> > /dev/cciss/c0d0p3 7555 8068 2097120 82 Linux swap
> > /dev/cciss/c0d0p4 8069 34866 109335840 5 Extended
> > /dev/cciss/c0d0p5 8069 10578 10240784 83 Linux
> > /dev/cciss/c0d0p6 10579 10587 36704 83 Linux
> > /dev/cciss/c0d0p7 10588 10596 36704 83 Linux
> > /dev/cciss/c0d0p8 10597 10725 526304 83 Linux
> > /dev/cciss/c0d0p9 10726 10988 1073024 83 Linux
> > /dev/cciss/c0d0p10 10989 11251 1073024 83 Linux
> > /dev/cciss/c0d0p11 11252 11776 2141984 83 Linux
> > /dev/cciss/c0d0p12 11777 12301 2141984 83 Linux
> > /dev/cciss/c0d0p13 12302 12826 2141984 83 Linux
> > /dev/cciss/c0d0p14 12827 13351 2141984 83 Linux
> > /dev/cciss/c0d0p15 13352 13876 2141984 83 Linux
> > /dev/cciss/c0d0p16 13877 34866 85639184 8e Linux LVM
> >
> > When a pvcreate is attempted on "/dev/cciss/c0d0p16" it produces the
> > below output.
> >
> > [root@lwlsvr informix]# pvcreate /dev/cciss/c0d0p16
> > pvcreate -- can't open physical volume "/dev/cciss/c0d0p16" to get its
> > size
> >
> AFAIK, the major/minor numbering scheme for block devices limits you to
> 15 partitions per device.
>
> Mark
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

thanks for the quick reply..
is it possible to create more than 15 partitions from fdisk, while
major/minor numbering scheme limitation is there ?
could you point me to someplace i can read more about on this?

thanks again
-- 
Yajith Ajantha

------=_Part_21479_11582493.1202893442287
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Feb 13, 2008 2:07 PM, Mark Huth &lt;<a href="mailto:mhuth@redhat.com">mhuth@redhat.com</a>&gt; wrote:<br><div class="gmail_quote"><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div><div></div><div class="Wj3C7c">Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:<br>&gt; Hi all,<br>&gt; Forgive me if this is the wrong list to ask this question.<br>&gt; I&#39;m quite new to LVM(-and to this list) and one of my friends brought<br>
&gt; this question up to me..<br>&gt;<br>&gt; There is an error coming up when they try to &quot;pvcreate&quot;<br>&gt;<br>&gt; Below is the &quot;fdisk -l&quot; output.<br>&gt;<br>&gt; [root@lwlsvr bin]# fdisk -l<br>&gt;<br>
&gt;<br>&gt; Disk /dev/cciss/c0d0: 145.6 GB, 145667358720 bytes<br>&gt; 255 heads, 32 sectors/track, 34866 cylinders<br>&gt; Units = cylinders of 8160 * 512 = 4177920 bytes<br>&gt;<br>&gt; Device Boot Start End Blocks Id System<br>
&gt; /dev/cciss/c0d0p1 * 1 25 101984 83 Linux<br>&gt; /dev/cciss/c0d0p2 26 7554 30718320 83 Linux<br>&gt; /dev/cciss/c0d0p3 7555 8068 2097120 82 Linux swap<br>&gt; /dev/cciss/c0d0p4 8069 34866 109335840 5 Extended<br>&gt; /dev/cciss/c0d0p5 8069 10578 10240784 83 Linux<br>
&gt; /dev/cciss/c0d0p6 10579 10587 36704 83 Linux<br>&gt; /dev/cciss/c0d0p7 10588 10596 36704 83 Linux<br>&gt; /dev/cciss/c0d0p8 10597 10725 526304 83 Linux<br>&gt; /dev/cciss/c0d0p9 10726 10988 1073024 83 Linux<br>&gt; /dev/cciss/c0d0p10 10989 11251 1073024 83 Linux<br>
&gt; /dev/cciss/c0d0p11 11252 11776 2141984 83 Linux<br>&gt; /dev/cciss/c0d0p12 11777 12301 2141984 83 Linux<br>&gt; /dev/cciss/c0d0p13 12302 12826 2141984 83 Linux<br>&gt; /dev/cciss/c0d0p14 12827 13351 2141984 83 Linux<br>
&gt; /dev/cciss/c0d0p15 13352 13876 2141984 83 Linux<br>&gt; /dev/cciss/c0d0p16 13877 34866 85639184 8e Linux LVM<br>&gt;<br>&gt; When a pvcreate is attempted on &quot;/dev/cciss/c0d0p16&quot; it produces the<br>&gt; below output.<br>
&gt;<br>&gt; [root@lwlsvr informix]# pvcreate /dev/cciss/c0d0p16<br>&gt; pvcreate -- can&#39;t open physical volume &quot;/dev/cciss/c0d0p16&quot; to get its<br>&gt; size<br>&gt;<br></div></div>AFAIK, the major/minor numbering scheme for block devices limits you to<br>
15 partitions per device.<br><br>Mark<br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>thanks for the quick reply..<br>is it possible to create more than 15 partitions from fdisk, while major/minor numbering scheme limitation is there ?<br>
could you point me to someplace i can read more about on this?<br><br>thanks again<br clear="all">-- <br>Yajith Ajantha

------=_Part_21479_11582493.1202893442287--
