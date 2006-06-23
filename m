Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5NGFpBn001293
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 12:15:51 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.168])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5NGFivq005543
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 12:15:44 -0400
Received: by ug-out-1314.google.com with SMTP id o2so1168105uge
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 09:15:43 -0700 (PDT)
Message-ID: <2908808b0606230915i2153ab2ewfd6687c3e948b310@mail.gmail.com>
Date: Fri, 23 Jun 2006 18:15:43 +0200
From: "Romain Cherchi" <romain.cherchi@gmail.com>
Subject: Re: [linux-lvm] lvcreate and lvremove issues
In-Reply-To: <20060623153122.GY19222@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9616_19843939.1151079343410"
References: <2908808b0606230813q748e8932n2f124916a7aa1b9b@mail.gmail.com>
	<20060623153122.GY19222@agk.surrey.redhat.com>
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

------=_Part_9616_19843939.1151079343410
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank you very much for your help and responding so quickly.

I indeed updated my system using the up2date redhat utility right after the
product activation.

Everything when right except for 2 packages:
- kernel
- kernel-smp

There was a package dependency problem.  The message was:

    To solve all dependencies for the RPMs you have selected, The following
    packages you have marked to exclude would have to be added to the set:

    Package Name                      Reason For Skipping
    ======================================================================
    kernel-2.6.9-34.0.1.EL            Pkg name/pattern
    kernel-devel-2.6.9-34.0.1.EL      Pkg name/pattern
    kernel-doc-2.6.9-34.0.1.EL        Pkg name/pattern
    kernel-hugemem-2.6.9-34.0.1.EL    Pkg name/pattern
    kernel-hugemem-devel-2.6.9-34.    Pkg name/pattern
    kernel-smp-2.6.9-34.0.1.EL        Pkg name/pattern
    kernel-smp-devel-2.6.9-34.0.1.    Pkg name/pattern
    kernel-utils-2.4-13.1.80          Pkg name/pattern

Unresolvable chain of dependencies:
kernel-2.6.9-34.0.1.EL                   conflicts with ipw2200-firmware <
2.2
kernel-smp-2.6.9-34.0.1.EL               conflicts with ipw2200-firmware <
2.2

The following packages were added to your selection to satisfy dependencies:
Package                                Required by
----------------------------------------------------------------------------

Please modify your package selections and try again.

I don't really know how to deal with this message in up2date so I just
unchecked the 2 packages and went ahead.

Right now, my kernel is still 2.6.9-34.

Do you know how to fix the problem with up2date? ... or should I download
the rpms and do the update myself ?

Regards



On 6/23/06, Alasdair G Kergon <agk@redhat.com> wrote:
>
> On Fri, Jun 23, 2006 at 05:13:34PM +0200, Romain Cherchi wrote:
> >  _deps: task run failed for (253:9)
>
> > I someone familiar with this problem?
>
> Looks like you've updated something and hit an incompatible package
> combination?
>
> Make sure your userspace device-mapper package is at least
> version 1.02.04 (with corresponding lvm2 update), or alternatively
> update your kernel to something more recent - 2.6.12 or later IIRC.
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Romain CHERCHI

------=_Part_9616_19843939.1151079343410
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank you very much for your help and responding so quickly.<br>
<br>
I indeed updated my system using the up2date redhat utility right after the product activation.<br>
<br>
Everything when right except for 2 packages:<br>
- kernel<br>
- kernel-smp<br>
<br>
There was a package dependency problem.&nbsp; The message was:<br>
<br>
&nbsp;&nbsp;&nbsp; To solve all dependencies for the RPMs you have selected, The following<br>
&nbsp;&nbsp;&nbsp; packages you have marked to exclude would have to be added to the set:<br>
&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; Package
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; Reason For
Skipping&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&nbsp;&nbsp;&nbsp; ======================================================================<br>
&nbsp;&nbsp;&nbsp;
kernel-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-devel-2.6.9-34.0.1.EL&nbsp;
&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-doc-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-hugemem-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-hugemem-devel-2.6.9-34.&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-smp-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp; kernel-smp-devel-2.6.9-34.0.1.&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
&nbsp;&nbsp;&nbsp;
kernel-utils-2.4-13.1.80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; Pkg
name/pattern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>
Unresolvable chain of dependencies:<br>
kernel-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
conflicts with ipw2200-firmware &lt; 2.2 <br>
kernel-smp-2.6.9-34.0.1.EL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
conflicts with ipw2200-firmware &lt; 2.2 <br>
<br>
The following packages were added to your selection to satisfy dependencies:<br>
Package&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Required by<br>
----------------------------------------------------------------------------<br>
<br>
Please modify your package selections and try again.<br>
<br>
I don't really know how to deal with this message in up2date so I just unchecked the 2 packages and went ahead.<br>
<br>
Right now, my kernel is still 2.6.9-34.<br>
<br>
Do you know how to fix the problem with up2date? ... or should I download the rpms and do the update myself ?<br>
<br>
Regards<br>
<br>
<br><br><div><span class="gmail_quote">On 6/23/06, <b class="gmail_sendername">Alasdair G Kergon</b> &lt;<a href="mailto:agk@redhat.com">agk@redhat.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
On Fri, Jun 23, 2006 at 05:13:34PM +0200, Romain Cherchi wrote:<br>&gt;&nbsp;&nbsp;_deps: task run failed for (253:9)<br><br>&gt; I someone familiar with this problem?<br><br>Looks like you've updated something and hit an incompatible package
<br>combination?<br><br>Make sure your userspace device-mapper package is at least<br>version 1.02.04 (with corresponding lvm2 update), or alternatively<br>update your kernel to something more recent - 2.6.12 or later IIRC.
<br><br>Alasdair<br>--<br><a href="mailto:agk@redhat.com">agk@redhat.com</a><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
<br></blockquote></div><br><br clear="all"><br>-- <br>Romain CHERCHI

------=_Part_9616_19843939.1151079343410--
