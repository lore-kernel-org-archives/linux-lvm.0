Message-ID: <3B83CDA2.AB7F6B3D@tls.msk.ru>
Date: Wed, 22 Aug 2001 19:20:02 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mail troubles at hermes.sistina.com[208.210.145.141]?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, linux-lvm-admin@sistina.com

I'm sorry for sending this message to list.

Today morning I noticied that our mailserver
rejected some mails from hermes.sistina.com
due to invalid (non-FQDN) SMTP HELO argument
(this is not rfc-compilant, and our mailserver
configured to reject such a misconfigured
clients).

I sent a notice to postmaster@sistina.com about
this issue, hoping it will be resolved soon.
But that my message still in our mailqueue,
with a message:

(host hermes.sistina.com[208.210.145.141] said:
 451 Cannot check <postmaster@sistina.com> at this time -
 please try later)

So Sistina also have no valid postmaster address
that is also required by RFC?  This way, it will
end up on rfc-ignorant.org's blacklist shortly! ;)

Now I whitelisted this IP address (it was once
whitelisted here already, due to reverse-DNS problem
that seems gone now), so I hope to receive some
mails from there from now on (if I was't unsubscribed
authomatically due to constant bounces, as our
mailserver rejected about 15 messages destined to me).

Something wrong with Sistina's mailserver, and needs
to be fixed soon.

Regards,
 Michael.
