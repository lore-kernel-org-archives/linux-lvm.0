Message-Id: <200202281024.LAA26544@mailgate.sara.nl>
From: Remco Post <r.post@sara.nl>
Subject: Re: [linux-lvm] Cluster LVM
In-Reply-To: Your message of
    "Wed, 27 Feb 2002 19:14:19 +0100."
    <20020227191419.J27155@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Feb 28 04:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> The VG being locked is not _that_ terrible - after all - you only need
> this to change your storage configuration (I don't expet the LVM to
> actually lock access to the device).

What happens with a lvextend? I guess it's perfectly possible to extend a=
n lv while the other node(s) in the cluster are accessing it. Or are ther=
 any problems? Problems that arise during the fs-grow operation are up to=
 the fs anyway, right?


-- =

Met vriendelijke groeten,

Remco Post

SARA - Stichting Academisch Rekencentrum Amsterdam
High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167

"I really didn't foresee the Internet. But then, neither did the computer=

industry. Not that that tells us very much of course - the computer indus=
try
didn't even foresee that the century was going to end." -- Douglas Adams
