Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j356v0O29335
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 02:57:00 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j356uruf025851
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 02:56:53 -0400
Date: Tue, 5 Apr 2005 08:56:52 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] [PATCH] --ignorelockingfailure for `lvm mkvgnodes`
Message-ID: <20050405065651.GE908@percy.comedia.it>
References: <20050403104158.GA6712@irc.pl>
	<20050403194207.GQ14307@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <20050403194207.GQ14307@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, Apr 03, 2005 at 08:42:07PM +0100, Alasdair G Kergon wrote:
>On Sun, Apr 03, 2005 at 12:41:58PM +0200, Tomasz Torcz wrote:
>>  `lvm vgmknodes` needs --ignorevglocking
>
>Agreed - though for different reasons (I won't go into here).
>
>'vgscan --mknodes --ignorelockingfailure' is normally adequate, and looks 
>to be so in your case?
>
so you mean
vgscan
vgchange -a y
vgscan --mknodes
???

Btw, i added man page to Tomasz patch

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

--dDRMvlgZJXvWKvBx
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="lvm2-ignorelock.patch.bz2"
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWWWOo7MAAGffgEIwWG//8P7n3a6/799kQAJ03Od3XY7QlEEmKeaEaj1Gg9QA
AAZA09E00eoJRAmp4mqD0mIaAAAADIBoAJFImnpR6I0NGmjR6gYQ00A0NDBBgkijU9KenpE2
hojQA0AAaAADIOQr5GXFSQY7OTrzcbn81+N6/UkkVfDA2b4CoXZHjRBqElijQlVHMr2tvFvm
EwJdaltsj+mqilVvHfPZ0JrrZpW9TVdq0jKNyJtUb/t1Str/oyEj9YYw2RKVJznBRVvyQqha
BpQFzT08rdTcMzIHGZm6VSo00E5FNIni4O7uwMPhvlRlDGFTBLKDkSVaGIhMb3ItYzGuQI2w
yEhGCpSCZnCFQT3KxOsNKzE1I3FBXM7bLHNLMtoKFCSdQWPpbSFYhOJEHzFRg7uGiSa+FWkZ
zcTvRSclahnDjAk5sGSOUNAxnR8KE3i8ze794HjPpWRIlyF2jvDy9Zs0Tpi7RSES54ntI53n
R2h5ktj2RKMk4WNpvOKVjJBjTGYuxryYZKVbeDlg/N1E8zTwHl5rOZwyBoIJhimJYeygohqg
akOyOP/Cw23ZRCEyJppCWpjorUO0zbYGFyihkTSLGjXSbNzEHosg1XF6E3Pa8I4UqXK+5Mqw
oRBDQxFZINlwvlsNFonI6hiT4dCavBVJDoaIrpfRpDK8kTLGRMBEGSjeREoo9AIk7K6xGYgF
1FCNK1YixDG0UGI4BNeLcisuUof+TGhioQgmwQrSp6QJ4YcCDWZwjcqJWoWEwxySzQkTtwIi
g0rhFpoJagPogxLq4iig+BI2f5qPzMz5WE9uP/F3JFOFCQZY6jsw

--dDRMvlgZJXvWKvBx--
