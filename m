content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Problems and questions with LVM on a large raid system.
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B3B7@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Wed Mar 12 21:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Wouldn't some of the processing be off-loaded to a dedicated controller?

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: jon+lvm@silicide.dk [mailto:jon+lvm@silicide.dk]
Sent: Wednesday, March 12, 2003 6:16 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Problems and questions with LVM on a large raid
system.


On Wed, Mar 12, 2003 at 03:59:57PM -0700, Kevin P. Fleming wrote:
> jon+lvm@silicide.dk wrote:
> >you're talking about raid0. You dont rebuild raid0. Not in hardware, =
not
> >in software.
>=20
> OK, I missed that extremely important and very obvious point :-)

thought so. Anyway, why would it take longer time to rebuild the
array using software rather than hardware raid? It's still the
same ammount of data needed to be copied.



JonB

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
