From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020511192728.GB3125@colombina.comedia.it>
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <671160000.1021077884@[192.168.200.4]>
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
Date: Sat May 11 14:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 10, 2002 at 07:44:44PM -0500, Steven Lembark wrote:
> 
> 
> -- Austin Gonyou <austin@coremetrics.com>
> 
> >>From what I understand you *can* mount the LVM volumes on multiple hosts
> 
> >at the same time, but you should be *readonly* on the hosts which do not
> >*own* the data on the disks. You could then *remount* the volume on the
> >target failover host.
> 
> I've had reasonable luck with this approach on other
> platforms (HP-UX, but the LVM is similar enough that
> it should work).

well actually a lot of details about the filesystem are cached on
an host, so you get relly funny results when you dont expect
filesystem metadata to change under your nose. I would not be
surprised to see a box panic under these circumstances.

> All it really needs is a "heartbeatd": you open a
> socket to, say, echo (port 1) and every second write
> a byte. If you don't get the byte back in, say, 100ms
> then you try one more time before re-mounting the LV
> rw on the backup host.

there is a tool called heartbeat on http://www.linux-ha.org/
have a look at it it really rocks.
it already has a resource that supports mounting of partitions
on shared media in case an hosts fail, it would be trivial
to adapt it for LVM

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
