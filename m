From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Endless loop running vgscan
Message-ID: <20031229144051.P21022@uk.sistina.com>
References: <3FE4DE2E.2030705@hasw.net> <20031221233848.M21022@uk.sistina.com> <3FE7483D.90107@hasw.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FE7483D.90107@hasw.net>; from se.witt@gmx.net on Mon, Dec 22, 2003 at 08:38:37PM +0100
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
Date: Mon Dec 29 08:42:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > Set up a filter in lvm.conf so that LVM2 only sees the RAID devices
> > and ignores the constituent devices that make up the RAID devices.

> I've also this problem if I use this filter:
> filter = [ "a/hd[e-h]1$/", "r/.*/" ]

Is that the wrong way round?  Accept the md devices instead of the
hd ones if your mds are formed from hds.

Alasdair
