content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B54C@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: [linux-lvm] snapshot size
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
Date: Thu Mar 20 12:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Lvm (E-mail)" <linux-lvm@sistina.com>

Hi All,
	I just got LVM2 w/XFS up and running recently. I rsync'd all of my =
existing home data into a new lv, and decided to test the snapshotting =
functionality. I had tested with a dd'd test file in a test lv prior to =
this, and all looked good. Now, I have a 110G lv with all of my home =
data in it. I create a snapshot lv (takes under 10 seconds!) of home =
without error, and I can mount the snapshot lv, and 'ls' it, poke around =
in it, and it *looks* like all is there. However, a df shows the =
snapshot volume to be only ~32G vs 110G for the original.

Q: Is this normal? Is the snap just way more space efficient?
Q: Also, how does the snapshot work so fast??

Thanks for all of your help,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com
