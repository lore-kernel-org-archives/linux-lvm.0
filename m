Date: Fri, 16 Nov 2012 16:33:47 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20121116153347.GB25670@jajo.eggsoft>
References: <20121116124809.GA25670@jajo.eggsoft> <50A6588F.10402@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <50A6588F.10402@redhat.com>
Subject: Re: [linux-lvm] cluster request failed: Host is down
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 16, 2012 at 04:15:27PM +0100, Zdenek Kabelac wrote:
> Cluster with just 1 node is not a cluster (no quorum)

It is a cluster, in a degraded state. An expected situation for two-node
cluster.

I use the corosync stack, which provides the quorum information (there
are special settings to provide quorum on failed two-node cluster) and I
have fencing configured to enforce the quorum. Every other piece of the
cluster trust the quorum information from corosync.

> So you may either drop locking --config 'global {locking_type =3D 0}'

That misses the point.

> or fix the dropped node.  Since you are admin of the system you
> know what to do -=20

Yes. Make sure the cluster has proper quorum and fencing configured.

The cluster is supposed to provide high availability =E2=80=93 which means
a graceful fail-over in case a node fails.

> system itself unfortunately cannot determine,
> whether the node A is master or node B is master (both could
> be alive, just Internet connection between them could be failing).

That is true if there is no proper fencing configured. But I have
working fencing. If there is no communication with the other node=20
(due to hardware or software problem) its power is turned off. It is
known that the other node is not 'master' at that moment.

As DLM already made sure the other node is not running (it would lock up
on any lock operation otherwise) I see no reason for CLVMD not to trust
DLM (that lock is provided to all lock-space members) and Corosync (that
we have quorum).

And the message says 'Host is down', not 'no quorum' or anything which
would suggest that is a problem.

Greets,
        Jacek
