Subject: Re: [linux-lvm] What are they talking about?
Message-ID: <OF3874E286.38AFB9D5-ON85256D2D.00693BB7@pok.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed May 21 14:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>Now I am really confused.  (Sorry folks, it doesn't take much).

>I thought that EVMS was dead.  The EVMS web site says something to the
>effect that the new EVMS product will be mostly a front end for (LVM?).
Am
>I reading that wrong?

No, EVMS is alive and well. EVMS was converted to use Device Mapper but and
adds on lots of new features such as File System coordination and
integration with MD (RAID support).

>Also in their announcement, the EVMS development group said that Linus
etal
>decided to include LVM but not EVMS.

Nope, LVM was removed from 2.5(6) kernel and replaced with DM (device
mapper).  Both EVMS and LVM2 (user tools) now use Device Mapper as threir
main kernel component.

>Can someone straighten me out, please?

Just did.

>Thanks

Welcome.

p.s.  Please ignore all the comments by Dan Frye about EVMS, he is
mistaken.

Steve
