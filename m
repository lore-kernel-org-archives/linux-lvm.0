content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
From: "Au, Richard" <rau@archway.com>
Subject: [linux-lvm] has anyone used LVM in a HA cluster?
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
Date: Thu May  9 11:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm wondering if anyone has used LVM in a high-availibility cluster
where two servers are connected to shared storage (the physical
volumes).  If so, which cluster solution did you use?  Will there be
problems if the logical volumes are visable to both servers, even if
only one of them has them mounted?  Thanks!

Richard Au
rau@archway.com
