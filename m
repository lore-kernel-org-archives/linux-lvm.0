From: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>
Subject: Re: [linux-lvm] filesystem errors
In-Reply-To: <20020304112801.D10007@sistina.com>
Message-Id: <Pine.LNX.4.44.0203050139150.25453-100000@tassadar.physics.auth.gr>
MIME-Version: 1.0
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
Date: Mon Mar  4 17:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Because you mention *huge* transfers the usual suspect is the VM subsystem IMO.
> Did you try 2.4.<10 which didn't have the faulty VM subsystem?

 I havent used this kind of setup before kernel 2.4.16 . Nevertheless , I
did some more extensive tests on non-lvmed loopback filesystems and
errors occur there too , so you propably have a point . However, going
back to 2.4.<10 might have other implications in my setup :) . I will try
it on a spare box though .

Kind regards ,


=============================================================================

Dimitris Zilaskos

Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
=============================================================================
