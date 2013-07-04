Date: Thu, 4 Jul 2013 12:18:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130704111817.GA3344@agk-dp.fab.redhat.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
	LVM	complains "there is no suitable space"
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
Content-Transfer-Encoding: 7bit
To: Alessandro MACUZ <alessandro.macuz@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 02, 2013 at 02:14:01AM +0200, Alessandro MACUZ wrote:
> Why "*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root
> /dev/sdb1*" doesn't work whereas
> "*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*" does? The space to be
> allocated differs by just one PE.
 
Exactly which version of lvm2 are you using?
Is it 2.02.97 or later?  If not, you should try a newer version.
To debug, you then need to run the command with -vvvv added to the command
line.  Post a link to this output if you want others to look.

Alasdair
