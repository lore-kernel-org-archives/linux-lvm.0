Date: Tue, 10 Feb 2009 16:00:14 +0100
From: hondza <mbdrzq8jm1wljrwyo1sk@gmail.com>
Subject: Re: [linux-lvm] dm-merge: userspace tool to merge copy-on-write
	exception table
Message-ID: <20090210150014.GI3702@hondza.sh.cvut.cz>
References: <20090209123047.GH3702@hondza.sh.cvut.cz>
	<1234238940.3257.984.camel@pc.interlinx.bc.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1234238940.3257.984.camel@pc.interlinx.bc.ca>
Reply-To: mbdrzq8jm1wljrwyo1sk@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Mark McLoughlin <markmc@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hello.

On 2009-02-09; 23:09:00, Brian J. Murrell wrote:
> On Mon, 2009-02-09 at 13:30 +0100, hondza wrote:
> > I liked the idea very much so I made a simple C tool to do so. Thanks to
> > Lars for describing how it works.
> 
> But how/why is it any different than the above project?

As to how: dm-merge is standalone, doesn't rely on any patches, and is
more of a hack. The CachedClient patches seem to be more robust.

As to why: first time I browsed the CachedClient web, I overlooked the
fact that effort was already made to implement the merge/revert feature.

> Cheers,
> b.

Regards,

-- 
hondza | GPG key: http://www.hondza.adslink.cz/key.asc
Fingerprint: 31E7 EF56 7280 5C89 75E9 FF9D 010E 175F 7823 CF38
GPG/PGP encrypted/signed emails are welcome.
