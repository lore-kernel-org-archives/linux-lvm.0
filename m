From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Broken Harddisk in LVM
Message-ID: <20030125132816.A5725@uk.sistina.com>
References: <20030122121446.A25896@sistina.com> <000c01c2c459$60523950$0300a8c0@quaiky>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000c01c2c459$60523950$0300a8c0@quaiky>; from kai@stella.at on Sat, Jan 25, 2003 at 11:06:03AM +0100
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
Date: Sat Jan 25 07:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 25, 2003 at 11:06:03AM +0100, Kai Iskratsch wrote:
> /usr/i486-suse-linux/bin/ld:.export.sym:1: parse error in VERSION script

Some versions of ld need the first line of lib/.export.sym to be:
Base {

Alasdair
