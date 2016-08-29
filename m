References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
	<40998f97-9728-c1e6-1c94-cab31fdef870@redhat.com>
	<fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
	<08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
	<62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <8904dd7f-5efa-6337-aafc-8b7fe2a08842@redhat.com>
Date: Mon, 29 Aug 2016 17:08:17 +0200
MIME-Version: 1.0
In-Reply-To: <62f29dda-8a04-9125-8b3e-3e9925f485e3@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: peljasz@yahoo.co.uk
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thank you for the lsblk and lvs output. At least now we know that raid 
is somehow involved in the setup...

On 08/29/2016 04:22 PM, lejeczek wrote:
> I cannot debug now as for now I've given up the idea to
> encrypt this LV, but  I would say is should be easily
> reproducible (maybe even waste of time looking at my setup)
> I simply tried:

Well, without the debug output from cryptsetup I can't be of any more 
help, I'm sorry. It's like starring into crystal ball guessing what may 
have gone wrong. The -22 error code is general "wrong parameters" 
answer. I don't even know if cryptsetup has got into code path where 
it's supposed to open the device for write.

But let me give it one last shot. Did you by any chance end up with 22 
right after the prompt:

"Are you sure? (Type uppercase yes):"

If so, are you sure that your answer was 'YES' instead of lowercase 'yes'?

Regards
Ondrej
