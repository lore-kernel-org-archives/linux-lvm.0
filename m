Message-ID: <4FBCA555.1050903@redhat.com>
Date: Wed, 23 May 2012 09:52:37 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
	<CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
	<54088.172.16.0.29.1337700576.squirrel@beer.org.uk>
	<4FBBB834.302@redhat.com>
	<54198.172.16.0.29.1337704836.squirrel@beer.org.uk>
	<9014EE43-9993-4CA7-B3B0-B1F85B668206@redhat.com>
	<56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
In-Reply-To: <56453.172.16.0.29.1337716744.squirrel@beer.org.uk>
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

On 05/22/2012 08:59 PM, Vic wrote:
> 
>> LVM requires that for an LV to be activated while there are
>> missing PVs, the '--partial' flag must be used.  If the script
>> running vgchange does not include '--partial', your mirror won't
>> be activated.
> 
> I tried that. It didn't work.

Maybe try reporting what happened and where it went wrong so that
others can try to help you? Just stating that you consider something
a bug doesn't really help to move things forward.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+8pVUACgkQ6YSQoMYUY96AkgCfWjDsChbxXaC46+XMxFW8EFvL
0/0An1K00il83NSow4qS31lHsROq64LA
=VuGB
-----END PGP SIGNATURE-----
