Date: Fri, 19 Oct 2001 09:08:53 +0100
Subject: Re: [linux-lvm] SnapRestore software on NetApp
Message-ID: <20011019090853.C435@btconnect.com>
References: <0110181646580Y.24876@in-cadcae4> <20011018174818.C849@btconnect.com> <20011018122021.G1144@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011018122021.G1144@turbolinux.com>; from adilger@turbolabs.com on Thu, Oct 18, 2001 at 12:20:22PM -0600
From: Joe Thornber <thornber@btconnect.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 18, 2001 at 12:20:22PM -0600, Andreas Dilger wrote:
> This may be possible to do in the short term with writable snapshots,
> but then you start getting into a very ugly situation where the "good"
> volume (i.e. the writable snapshot) depends on the snapshot, which
> depends on the original "bad" volume and you can't get rid of any of them.

I suppose the ideal solution is to allow people to choose which way
round a snapshot is taken depending on whether they thinks it's likely
they'll rollback, or commit to the snapshot.

ie.

You probably want to rollback; the snapshot lv contains new data written to 
the snapshot (as it is now).  Rollback is quick, commit (merge) is slow.

You probably want to commit to the snapshot; the snapshot lv contains
copies of the original data.  Rollback (merge) is slow, commit is quick.

- Joe
