From: Michael Frotscher <michael@frotscher.net>
Subject: Re: [linux-lvm] drive-spindown
References: <200209251011.05774.michael@frotscher.net> <20020925112539.A29192@sistina.com>
In-Reply-To: <20020925112539.A29192@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209251151.25358.michael@frotscher.net>
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
Date: Wed Sep 25 05:05:07 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wednesday 25 September 2002 11:25, Heinz J . Mauelshagen wrote:

> that could be either some regular access to extents residing on hdb

So you are saying that the volume can be used (like accessing hdb) even=20
though hdc is spun down? Amazing - I did not know that was possible.=20
But if, it is a good explanation as my volume still has plenty of space=20
so hdc would not be accessed until hdb is full.
--=20
Cheers,

Michael=20
