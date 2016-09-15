References: <4c5fc2ba-339c-48c6-1039-1e238fda2321@gmail.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <53b93052-192a-3e7a-f67c-aa94cb6aae84@redhat.com>
Date: Thu, 15 Sep 2016 09:23:04 +0200
MIME-Version: 1.0
In-Reply-To: <4c5fc2ba-339c-48c6-1039-1e238fda2321@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] "lvmetad: Failed to accept connection" on poweroff
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: protserovsd@gmail.com

On 09/15/2016 06:00 AM, Сергей Процеров (Sergey Protserov) wrote:
> Hello! I am using Debian Unstable, systemd, full-disk encryption and lvm
> (version 2.02.164). On poweroff that's what I see in journal:
> сен 12 22:36:51 debian systemd[1]: Stopping LVM2 metadata daemon...
> сен 12 22:36:51 debian lvmetad[332]: Failed to accept connection.
> сен 12 22:36:51 debian systemd[1]: Stopped LVM2 metadata daemon.
> Could you please tell me, if this error signalizes something bad, and if
> this error should be fixed? If it has to be fixed, then how can I do it?
> Thanks in advance.
> 

We've had a report recently about this but it was closed because it was
not reproducible anymore by reporter:

  https://bugzilla.redhat.com/show_bug.cgi?id=1367686

Does this error happen always or only sometimes? Would it be possible
for you to update to lvm2 v2.02.165 and then hit this error again? In
that version, we added a bit more info for the error state that is
printed in this case so this would give us more insight about why the
failure happens exactly.

Thanks.

-- 
Peter
