Message-ID: <3B83566E.F335F1ED@tronicplanet.de>
Date: Wed, 22 Aug 2001 08:51:26 +0200
From: Knollmueller Stefan <stefan.knollmueller@tronicplanet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot on xfs filesystem
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
To: linux-lvm@sistina.com

hello,
we have got a serious problem doing snapshots on an xfs filesystem
(exported via nfs) while there is access to it via nfs or the fs being
only mounted by another machine via nfs.
in that case the machine hangs totally and the only possibilty left is
the kdb...
the problem does not occur if the fs is not mounted by another machine
in this case everything works just fine.
does anybody know what to do, is there a patch?

stefan
