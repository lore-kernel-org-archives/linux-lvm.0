Message-ID: <4FBBB834.302@redhat.com>
Date: Tue, 22 May 2012 17:00:52 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
In-Reply-To: <54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/22/2012 04:29 PM, Vic wrote:
> 
>> How is it different/better than 'mdadm --fail' ing a member out
>> of an MD raid1 set as a temporary snapshot?
> 
> You can do it to a box that hasn't been set up with mdadm...

Sure but you will need LVM set up. In that case, why not use LVM's
snapshot capabilities? If you're using a distribution with a recent
kernel then you'll have access to the new shared snapshot
implementation that gives far better performance than the old
non-shared one.

Some distributions (yum based) even include a package updater plug-in
that will automatically take snapshots before applying a set of
package updates and allow you to either rollback or merge the change
after testing.

You might find this works better for this particular use of mirroring
but you can also try the --splitmirrors option to the lvconvert
command (but it will be less efficient since it will take a
block-by-block copy of the origin during the lvconvert -m1 rather than
just recording changes as a snapshot would). Mirror splitting was
added in 2.02.88 (about nine months old).

I've found that dracut doesn't always handle LVM errors particularly
gracefully (in particular if there is a problem the dracut main loop
appears to reset state after leaving the interactive shell so even if
you do fix the problem such that the system could continue to boot it
will just fail in the same way again) and by the sound of it this
could be improved for your case too.

Ideally you'd want the initramfs scripts to carry out the same actions
as the defined mirror repair policy during startup (or to invoke
lvconvert --repair to do the same).

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+7uDQACgkQ6YSQoMYUY95ECwCgkcYwE6ujXi5rLOApVZg5wSWN
pj8An05qCXCcaOSt+sgOZvpYORKHU4gM
=zW6z
-----END PGP SIGNATURE-----
