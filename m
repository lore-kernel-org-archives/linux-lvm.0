From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020513115601.GA14481@colombina.comedia.it>
References: <20020510072608.GA1001@tykepenguin.com> <1021071171.17474.44.camel@UberGeek> <671160000.1021077884@[192.168.200.4]> <20020511192728.GB3125@colombina.comedia.it> <3CDF8482.7010109@lausch.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3CDF8482.7010109@lausch.at>
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
Date: Mon May 13 06:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, May 13, 2002 at 11:16:50AM +0200, Michael Lausch wrote:
> And make sure the daemons are running in the real time scheduler class.
> There exists a state, commomly refered to as "split brain", where the 
> nodes of a cluster "think" the other one is down, which is not the fact. 
you are very right!
I believe the best solution would be having a lock manager
that uses the shared storage to provide a lock.
Another option is to have an external node which funcions
as an arbitrator. (i.e. the external quorum found in HP MC/SG
for Linux)
Last option, which as i rekon is the only one that can be implemented
with heartbeat atm is having one node effectively kill the other one,
by turning off the power. But it would make me very nervous.


L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
