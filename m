Date: Wed, 27 Sep 2000 14:57:41 -0500
From: Michael J Kellen <idsfa@visi.com>
Subject: [linux-lvm] LVM High Availability
Message-ID: <20000927145741.A9511@isis.visi.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

From: Mats Wichmann <mats@laplaza.org>

> Does anybody have any experience to contribute about what other
> LVM systems do in these situations?  They don't have the dynamic
> scan/assignment stuff in Solaris or AIX, right?  (Showing my
> ignorance here).

The logical volume manager in Tru64 (aka Digital Unix, aka OSF/1)
from the Q (compaQ) handles high availability by packaging the
volumes in disk groups.  A given disk group may only be imported
into one of the machines on the shared bus.  Since this is basically
a relicensed Veritas (I think), I expect similar strategies in other
environments.


Michael Kellen
