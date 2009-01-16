Date: Fri, 16 Jan 2009 22:36:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM and snapshot performance
Message-ID: <20090116223649.GC1804@agk.fab.redhat.com>
References: <AAFA5C94-E986-4CE5-9842-D94C70BA87F1@yahoo-inc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AAFA5C94-E986-4CE5-9842-D94C70BA87F1@yahoo-inc.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wayne H. Badger" <badger@yahoo-inc.com>
Cc: linux-lvm@redhat.com

1. You don't say what filesystem/journal configuration is involved.

2. Is it a system where you can run test kernels or is it too 'live' for that?

3. Try all the syncing and cache flushing options before issuing the lvremove.

4. Could it depend on the amount of io load over a short period before the
lvremove runs, rather than something cumulative?

5. What more can you find out from ps/iostat/sysrq/lvm logging about what the
system is doing during the lvremove?

6. What devices/drivers are involved in the stack?  (We had a perhaps-related
issue show up with loop.)

Alasdair
-- 
agk@redhat.com
