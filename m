From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] vgcreate bug?
Message-ID: <20021223224907.A20127@uk.sistina.com>
References: <Pine.LNX.4.44.0212231927280.31788-100000@server.piarista-kkt.sulinet.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212231927280.31788-100000@server.piarista-kkt.sulinet.hu>; from nagyz@piarista-kkt.sulinet.hu on Mon, Dec 23, 2002 at 07:34:35PM +0100
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
Date: Mon Dec 23 16:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 23, 2002 at 07:34:35PM +0100, NagyZ wrote:
> vgchange -an
> and (with lvm2 tools):
> vgconvert -M2 test

Missing vgchange -ay (with LVM2 tools) here?
 
> then:
> debian:~# mount /dev/test/testlv /teszt
> mount: /dev/test/testlv is not a valid block device

[It's possible the problem is with LVM1 volume group links in /dev left behind 
by LVM1; if so, just remove them before the LVM2 vgchange -ay; this is 
libdevmapper being ultra-cautious; will get changed soon.]
 
Alasdair
-- 
agk@uk.sistina.com
