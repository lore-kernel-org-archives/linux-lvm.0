content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] extending LVM for school project
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC1A1C30@blr-m3-msg.wipro.com>
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
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
Date: Thu Apr 10 09:10:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: k@kaisung.com

What about working towards making LVM cluster aware and making it more
available, putting in better failover mechanisms in a clustered
environment ...

If the work is done for for a hybrid setup (no need to have a shared
disk, or you may have a mix of shared disk and just a some disks
connected to one of the nodes in the network.) you can save the cost of
having to buy expensive disks and switches and can do the work with the
available setup in the university.

I am myself planning to work towards extending LVM2 for such a setup and
we can share our work : )O

Thanks,
Sharad.

> >-----Original Message-----
> >From: Kai-Min Sung [mailto:k@kaisung.com]
> >Sent: Wednesday, April 09, 2003 11:25 AM
> >To: Linux-lvm@sistina.com
> >Subject: [linux-lvm] extending LVM for school project
> >
> >Hey everyone,
> >	I'm a masters student taking a distributed systems project class
> >and would like to work on extending LVM. My initial idea was to
modify
> >LVM and allow it to create physical volumes using disks on remote
nodes.
> >But then I read posts about using ENBD to achieve this. Do people on
> >this list have suggestions or ideas for a fun/interesting project
that
> >could be accomplished within 10 weeks?
> >
> >Regards,
> >Kai-Min Sung
> >
> >
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
