Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
References: <20020219221959.P25713@lynx.adilger.int>
    <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
    <NBBBKLKHMJHIJLHOGAOJIEPAJEAA.steve.wray@paradise.net.nz>
    <20020220103147.A890@lynx.adilger.int>
From: Rupa Schomaker <rupa-list@rupa.com>
Message-Id: <m3zo23u0o7.fsf@shakti.rupa.com>
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
Date: Wed Feb 20 18:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----

Andreas Dilger <adilger@turbolabs.com> writes:

> Swap is a bad move, since you can just add multiple swap spaces with the
> same priority (if you so choose) and it will do the striping for you.
> Likewise, you could put each of the above trees on their own drive and
> you would probably get better overall performance than striping.

This suggestion has always bothered me.  Yes, if all you care about
performance, setting up swap this way works fine.  However, for every
drive you add you increase the likelyhood that you're system will fail
due to a drive failure (what happens when one of the swap slices
suddenly dissapears?).

The better (IMO) suggestion is to use MD to setup RAID-1 mirrors and
then swapadd those.  That way, if one of your drives go south, you
still have a workable swap.

- -- 
- -rupa

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia
Charset: noconv
Comment: Processed by Mailcrypt 3.5.6, an Emacs/PGP interface

iQEVAwUBPHRCF3HDM4ucEopdAQHojAf/TbnHkeXcK6KwF+wQKOug8FcqJoNsZB8s
6XmCvL2V9QIdEMguXEob4qys/h2Km008xfXXvzIW+g8eXl/8zhoQAtQxRgBpJWZj
Xa7XdzHUW2tEGTwztr5w/FJKFtL5nqqme6aYcILpbD2RFosgCSI8rm26QcgvSbXv
/L6xmKx7ha5tD1QuMrh9/dVf5ei//c4BPiLeLSItmPaybm6DCL9NIYADQK+8WtLh
WUDKycmjd+KTzFPiEH9Wmca+pbqE9XTEfmbsDRrTUSA9Fyeg3Y/t5KG4E1eI4HfS
HtJvbtyYEY2uUAgiSPMcicbtxaOnyrJBoHGdBjmX6WK13lHQhoeQpA==
=X3cg
-----END PGP SIGNATURE-----
