From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: Re: [linux-lvm] vgcreate bug?
In-Reply-To: <20021223224907.A20127@uk.sistina.com>
Message-ID: <Pine.LNX.4.44.0212240010060.32481-100000@server.piarista-kkt.sulinet.hu>
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
Date: Mon Dec 23 17:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 23 Dec 2002, Alasdair G Kergon wrote:

> On Mon, Dec 23, 2002 at 07:34:35PM +0100, NagyZ wrote:
> > vgchange -an
> > and (with lvm2 tools):
> > vgconvert -M2 test
> 
> Missing vgchange -ay (with LVM2 tools) here?
that doesnt matter :)

>  
> > then:
> > debian:~# mount /dev/test/testlv /teszt
> > mount: /dev/test/testlv is not a valid block device
> 
> [It's possible the problem is with LVM1 volume group links in /dev left behind 
> by LVM1; if so, just remove them before the LVM2 vgchange -ay; this is 
> libdevmapper being ultra-cautious; will get changed soon.]
yes..
i tested again:
after the convert i did rm /dev/test -Rf, then vgchange -ay, and WORKS! :)
thnx

NagyZ
