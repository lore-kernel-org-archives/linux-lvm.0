From: David Stes <stes@pandora.be>
Message-ID: <20020519112259.A23704@newt.stes.be>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] writable snapshots ? (a la timefinder BCV)
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
Date: Sun May 19 04:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

There is an option --snap to the lvcreate utility to create a read-only snapshot(frozen image) of a volume.

Is there a possibility to quickly create a rw (read/write) snapshot of a logical volume ?

I'm thinking here of applications in the style of EMC Timefinder BCV's (bcv = business continuance volumes).

For example, I want to create a snapshot of a mounted volume running Informix.

The snapshot of the mounted logical volume will be inconsistent, but it appears then to contain a 'crashed' instance of Informix, and when mounting the snapshot, I'd like to replay logfiles (do a recovery on the crashed instance) for which I need read/write access to the snapshot ...

Thank you,
David Stes.
