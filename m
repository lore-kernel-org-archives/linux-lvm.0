Subject: Re: [linux-lvm] Problem with LVM over RAID-1
References: <NEBBLHFAEINCLDICDLOAOEPKCHAA.yves.alloyer@slpinfoware.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 15 Oct 2001 21:25:17 +0200
In-Reply-To: <NEBBLHFAEINCLDICDLOAOEPKCHAA.yves.alloyer@slpinfoware.com>; from "yves.alloyer" on Mon, 15 Oct 2001 13:02:26 +0200
Message-ID: <m2ofn8904i.fsf@isnogud.escape.de>
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"yves.alloyer" <Yves.ALLOYER@slpinfoware.com> writes:

> There is something going wrong in lvm_check_partitioned_dev.
> AFAIK the problem is being investigated. Since you probably don't want to
> partition any of your MD devices, the following patch should do it. It just
> tells LVM to use the whole device.
> I've got that running... (2.4.10/1.0.1-rc4).
> Hope it helps.

Thank you (and all others you have replied to my question).  We have
looked into the source, too, and did a similar but very dirty patch,
just to get it to work.  We just inserted a return 0.  We'll consider
upgrading to the CVS version.

Thanks again
urs
