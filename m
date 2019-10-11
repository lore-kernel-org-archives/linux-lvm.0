References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<dd28a375-f1f5-9ae0-e843-cb67de3136a9@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <491a6f93-7b6d-0e51-5e0d-fc6911bd91e9@redhat.com>
Date: Fri, 11 Oct 2019 12:38:31 +0200
MIME-Version: 1.0
In-Reply-To: <dd28a375-f1f5-9ae0-e843-cb67de3136a9@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Heming Zhao <heming.zhao@suse.com>, Gang He <GHe@suse.com>

Dne 11. 10. 19 v 11:22 Heming Zhao napsal(a):
> Only one thing I am confusion all the time.
> When read/write error, lvm will call bcache_invalidate_fd & _scan_dev_close to close fd.
> So the first successfully read (i.e.: f747), which following f748 finally has fc68's fd.
> This will cause f747 metadata overwrite not f748.
> 
>

Hi

Have you considered checking newer version of lvm2?

Regards

Zdenek
