Return-Path: <thornber@btconnect.com>
Date: Sun, 22 Apr 2001 13:09:24 +0100
Message-ID: <20010422130924.A10390@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <thornber@btconnect.com>
Subject: [linux-lvm] What have snapshots got to do with LVM ?
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
To: linux-lvm@sistina.com, linux-openlvm@nl.linux.org

Just a random Sunday morning thought:

Why don't we split snapshots off into their own driver so we can
snapshot any block device, putting the COW tables on any other block
device ?  

We would need to add a per device hook like 'make_request' to the kernel
(rather than per driver).

I think it would simplify both LVM and the snapshot code (which at the
moment knows too much about physical extents etc.).


- Joe
