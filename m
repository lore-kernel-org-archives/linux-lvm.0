Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C38E0FF@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
MIME-Version: 1.0
Subject: [linux-lvm] forcing scan
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
Date: Mon Jan 19 10:07:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have 2 systems connected to the same storage. I automate the storage
discovery and the lvm discovery on startup.

I removed a PV all the way, dding the disks 1st block, on system A.
I then wanted to re-discover my lvm status on ssytem B.

Whatever I did, lvscan -D, vgscan, pvscan, nothing got rid of the indication
that the cleared disk is a PV. The only thing that worked was to rmmod
lvm-mod and insmoding it again. Then the scans worked, but it is
unacceptable since there are other active VGs.

I'm pretty sure there is a way to "force" real rediscovery. If only I could
find it.

Any ideas?

Thanks,
Dan
