From: William B Hill <W.B.Hill@uea.ac.uk>
Message-ID: <20030322155219.A1270@cpca7.uea.ac.uk>
References: <20030321122848.GA3352@birko.cjb.net> <20030321130855.GA20432@gw.silicide.dk> <20030321193533.GA29740@birko.cjb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030321193533.GA29740@birko.cjb.net>
Subject: [linux-lvm] Snapshot rsync backup.
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
Date: Sat Mar 22 09:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've written a simple backup script that makes snapshots, rsyncs them
with external removeable media and then cleans up.
If that's any use, it's at http://wbh.org/code/snapback
