From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040101184805.GA10139@percy.comedia.it>
References: <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is>
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
Date: Thu Jan  1 12:49:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 01, 2004 at 04:47:54PM +0000, Kjartan Reynir Hauksson wrote:
>hmmmmm..... I'm getting a different kernel panic, this time it tells me to
>try and pass the init= option but I saw it managed to load the device
>mapper.  Any gotchas you know of that I might be missing ?
>
if you were able to give more information about what happened i would be
able to help more, but as i dont' own a scrying orb at the moment i am a
bit at loss.

could you please copy a bit more of the messages that appear before the
panic?

can you provide the output of the mkninitrd -v .... command

btw are you using devfs? (but i tought i squashed that bug)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
