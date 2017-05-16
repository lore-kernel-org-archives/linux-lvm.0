References: <4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<0535f3d744145eceea9121b1e68b622d@assyoma.it>
	<d6923067-a96f-191e-15e0-42a6bf29b37e@redhat.com>
	<4fb6f017d9734892eff6b0ef544d99fc@assyoma.it>
	<20ddda25-dacf-f4e2-8df4-f9bed1c62fe7@redhat.com>
	<c5bee073-7871-fbb9-370d-8a1b322bbd86@assyoma.it>
	<921a6b9c-103e-3c71-97d2-44ceb5a6bf87@redhat.com>
	<f87b9a3de7c1871142cd47251e18c5fe@assyoma.it>
	<a8c9afaa-6b63-e60c-e37e-a845fdc8ff40@assyoma.it>
	<d5cfbd0b-5e2d-375b-f474-54ba7483ece9@assyoma.it>
	<20170512134157.GA2523@nim>
	<b0e4f2d1cfca0ea32da27b1cb34bf1be@assyoma.it>
	<b3372535-379f-8771-7395-6b0e4ba72f0d@redhat.com>
	<5358d81c-bc94-8ce1-24e1-a5795502fffc@assyoma.it>
	<24d541f6-2c99-2c39-f398-6290275f0430@redhat.com>
	<f4cff7e3-03b1-86d1-5fae-ed0f495e17c3@assyoma.it>
	<d54f2863-c2c5-d2a7-aba4-8a8a6b43ea7c@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <349b7d17-c8f5-f2fb-7e15-4af8287ef0d5@assyoma.it>
Date: Tue, 16 May 2017 15:38:56 +0200
MIME-Version: 1.0
In-Reply-To: <d54f2863-c2c5-d2a7-aba4-8a8a6b43ea7c@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 16/05/2017 12:54, Zdenek Kabelac wrote:
> 
> Hi
> 
> Somehow I think you've rather made a mistake during your test (or you 
> have buggy kernel). Can you take full log of your test  show all options 
> are
> properly applied
> 
> i.e. dmesg log +  /proc/self/mountinfo report showing all options used 
> for mountpoint and kernel version in use.
> 
> IMHO you should get something like this in dmesg once your pool gets out 
> of space and starts to return error on write:
> 
> ----
> Aborting journal on device dm-4-8.
> EXT4-fs error (device dm-4): ext4_journal_check_start:60: Detected 
> aborted journal
> EXT4-fs (dm-4): Remounting filesystem read-only
> ----
> 
> 
> Clearly when you specify 'data=journal'  even write failure of data will 
> cause journal error and thus remount-ro reaction (it least on my box 
> does it) - but such usage is noticeable slower compared with 'ordered' 
> mode.

Zdenek, you are right: re-executing the test, I now see the following 
dmesg entries:

[ 1873.677882] Aborting journal on device dm-6-8.
[ 1873.757170] EXT4-fs error (device dm-6): ext4_journal_check_start:56: 
Detected aborted journal
[ 1873.757184] EXT4-fs (dm-6): Remounting filesystem read-only

At the same time, looking at bash history and /var/log/messages it 
*seems* that I did nothing wrong with previous tests. I'll do more tests 
and post here if I find something relevant.

Thanks for your time and patience.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
