From: ishamael@erroneous.demon.co.uk
Message-Id: <199903110025.AAA03972@misguided.mersinet.co.uk>
Subject: Re: [linux-lvm] Bonehead problem 
In-Reply-To: Your message of "Wed, 10 Mar 1999 17:44:00 CST."
             <19990310174400.A21548@ixion.honeywell.com> 
Mime-Version: 1.0
Date: Thu, 11 Mar 1999 00:25:55 +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Shawn Leas wrote:
>When I upgraded to v0.6 from v0.5alpha, I end up having
>to keep the old v0.5 version of vgscan around.
>
>Reason? Well, this is WEIRD... v0.6 vgscan always errs out
>with 96, or, invalid IO/protocol version. Then, I use v0.5
>vgscan, and the same happens. Then, I use v0.6 vgscan again,
>and IT WORKED!
>
>What the hell is going on?

Did you build lvm as a module? _insmod lvm_ worked for me, after several hours 
of profound confusion.

-michael
-- 
St michael (mainly) Erroneous   http://www.erroneous.demon.co.uk/
"It's ok to be bitter and twisted,
 Provided you don't mind leaving a nasty taste in your own mouth."
