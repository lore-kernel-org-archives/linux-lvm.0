Message-ID: <3BB14C7D.CDCD9F14@bellatlantic.net>
Date: Tue, 25 Sep 2001 23:33:17 -0400
From: Uday Bhaskar Sarma Seetamraju <sarma@bellatlantic.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM help re:
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

Hi,

pvscan tells me which PV belongs to which VG.
But I am wondering if the information as to
"which PVwas added to the VG in which order"
can also be determined.
In case of a disaster, the first added PV would most likely contain
all the information that's has been around longer (and so more
important!)

Sarma

P.S: An 'ls' will not tell you in which order files/subfolders were
    created, but du or tar does.

P.S: Getting used to LVM reminds me of the days of early
        minivax/ultrix days (my first unix impressions), where each
        'rm' and 'mv' and 'cp' command was "entered" after 10
        deep breaths and 2 minutes of deep thought about what
        "that" command WILL do (when "entered" ofcourse!!).
        Not a criticism of LVM, just that the flexibility and new-ness
        of this concept lets one kill oneself so easily.
        Can't speak for the world, but I can't handle this
        kind of flexibilty and power.
